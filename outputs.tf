output "blockscout_link" {
  value = "${var.blockscout_link}/${resource.ethereum_contract_deployment.deploy.contract_address}"
}
