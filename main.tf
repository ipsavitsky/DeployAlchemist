data "ethereum_eoa" "signer_account" {
  mnemonic = var.signer_mnemonic
}

resource "ethereum_contract_deployment" "deploy" {
  signer = data.ethereum_eoa.signer_account.signer

  artifact = var.artifact_path

  input = var.contract_inputs
}
