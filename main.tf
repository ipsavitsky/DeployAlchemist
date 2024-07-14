# export GODEBUG=asyncpreemptoff=1;
locals {
  name2id = {
    "SEPOLIA"        = 11155111
    "POLYGON_MUMBAI" = 80001
    "SCROLL_SEPOLIA" = 534351
    "ALFAJORES"      = 44787
    "FUJI"           = 43113
    "BSC_TESTNET"    = 97
    "MOONBASE_ALPHA" = 1287
    "PLUMETESTNET"   = 161221135
  }

  id2address = {
    11155111  = "0xfFAEF09B3cd11D9b20d1a19bECca54EEC2884766"
    80001     = "0x2d1889fe5B092CD988972261434F7E5f26041115"
    534351    = "0x3C5154a193D6e2955650f9305c8d80c18C814A68"
    44787     = "0xEf9F292fcEBC3848bF4bB92a96a04F9ECBb78E59"
    43113     = "0x5b6CFf85442B851A8e6eaBd2A4E4507B5135B3B0"
    97        = "0xF9F6F5646F478d5ab4e20B0F910C92F1CCC9Cc6D"
    1287      = "0x76189acFA212298d7022624a4633411eE0d2f26F"
    161221135 = "0x33dB966328Ea213b0f76eF96CA368AB37779F065"
  }

  mailbox_abi          = "${path.module}/ABIs:Mailbox"
  payload              = jsondecode(data.local_file.contract.content)["bytecode"]
  padded_golem_address = "0x${format("%064s", substr(var.golem_address, 2, -1))}"
  merged_abi           = "${local.payload}${data.external.calculate_abi.result["payload"]}"
  extended_abi = jsonencode([
    {
      type_ = "address"
      value = data.ethereum_eoa.signer_account.address
    },
    {
      type_ = "uint8"
      value = 0
    },
    {
      type_ = "bytes"
      value = local.merged_abi
    },
    {
      type_ = "bytes32"
      value = random_bytes.salt.hex
    }
  ])
}

data "ethereum_eoa" "signer_account" {
  mnemonic = var.signer_mnemonic
}

data "local_file" "contract" {
  filename = var.contract_abi_path
}

resource "null_resource" "fee_trigger" {
  triggers = {
    timestamp = timestamp()
  }
}

data "external" "calculate_additional_data" {
  program = ["sh", "-c", "python3 ${path.module}/scripts/encode_abi.py '${local.extended_abi}'"]
}

resource "ethereum_transaction" "get_quote" {
  signer = data.ethereum_eoa.signer_account.signer

  to       = local.id2address[local.name2id[var.source_chain]]
  artifact = local.mailbox_abi
  method   = "quoteDispatch"
  input = [
    local.name2id[var.destination_chain],
    local.padded_golem_address,
    data.external.calculate_additional_data.result["payload"]
  ]
  lifecycle {
    replace_triggered_by = [null_resource.fee_trigger]
  }
}

data "ethereum_call" "get_quote" {
  to       = local.id2address[local.name2id[var.source_chain]]
  artifact = local.mailbox_abi
  method   = "quoteDispatch"
  input = [
    local.name2id[var.destination_chain],
    local.padded_golem_address,
    data.external.calculate_additional_data.result["payload"]
  ]
  depends_on = [ethereum_transaction.get_quote]
}

resource "random_bytes" "salt" {
  length = 16
}

data "external" "calculate_abi" {
  program = ["sh", "-c", "python3 ${path.module}/scripts/encode_abi.py '${jsonencode(var.contract_inputs)}'"]
}

resource "ethereum_transaction" "deploy" {
  signer = data.ethereum_eoa.signer_account.signer

  to       = var.alchemist_address
  function = "sendCommand(uint32, bytes32, uint8, bytes calldata, bytes32) external payable"
  input = [
    local.name2id[var.destination_chain],
    local.padded_golem_address,
    0,
    local.merged_abi,
    random_bytes.salt.hex,
  ]
  value = data.ethereum_call.get_quote.output["fee"]

  lifecycle {
    ignore_changes = [value]
  }
}

data "external" "calculate_address" {
  program = ["sh", "-c", "python3 ${path.module}/scripts/calculate_address.py '${jsonencode({"sender" = var.golem_address, "salt" = random_bytes.salt.hex, "init_code" = local.extended_abi})}'"]
}
