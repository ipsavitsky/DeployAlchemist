locals {
  mailbox_address = "0xfFAEF09B3cd11D9b20d1a19bECca54EEC2884766"
  mailbox_abi     = "${path.module}/ABI:Mailbox"
  golem_address   = "0x62710A99E1558332080681849184b21Fd7f16a18"
}

data "ethereum_eoa" "signer_account" {
  mnemonic = var.signer_mnemonic
}

data "local_file" "contract" {
  filename = var.contract_abi_path
}

resource "ethereum_transaction" "get_quote" {
  signer = data.ethereum_eoa.signer_account.signer

  # TODO: actually put in the address
  # to       = local.mailbox_address
  # function = "quoteDispatch(uint32, bytes32, bytes calldata) external view returns (uint256)"
  to       = local.mailbox_address
  artifact = local.mailbox_abi
  method   = "quoteDispatch"
  input = [
    var.destination_chain,
    local.golem_address,
    data.local_file.contract.content
  ]
}

data "ethereum_call" "get_quote" {
  artifact = local.mailbox_abi
  method   = "quoteDispatch"
  to       = local.mailbox_address
}

# resource "ethereum_transaction" "deploy" {
#   signer = data.ethereum_eoa.signer_account.signer

#   to = local.alchemist_address
#   # TODO what are the arguments?!
#   function = "deploy(...)"
#   input    = []
#   value    = "${local.read_val} gwei"
# }

