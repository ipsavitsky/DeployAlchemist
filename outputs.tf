output "blockscout_link" {
  value = "${var.blockscout_link}/address/${data.external.calculate_address.result["address"]}"
}

output "gas_quote" {
  value = data.ethereum_call.get_quote.output
  description = "The amount of gas that was quoted by Hyperlane for the cross chain transaction"
}
