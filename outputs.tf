# output "blockscout_link" {
#   value = "${var.blockscout_link}/${resource.ethereum_contract_deployment.deploy.contract_address}"
# }

output "gas_quote" {
  value = data.ethereum_call.get_quote.output
}
