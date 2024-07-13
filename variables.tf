variable "signer_mnemonic" {
  type      = string
  sensitive = true
  description = "A mnemonic phrase for the signer wallet on the source chain"
}

variable "contract_abi_path" {
  type = string
  description = "A file path to the JSON ABI of the contract"
}

variable "contract_inputs" {
  type        = list(object({ type_ = string, value = any }))
  description = "A list of maps of input parameters for deployed smart contracts."
}

variable "destination_chain" {
  type        = string
  description = "Destination testnet name. Can only be \"SEPOLIA\", \"POLYGON_MUMBAI\", \"SCROLL_SEPOLIA\", \"ALFAJORES\", \"FUJI\", \"BSC_TESTNET\", \"MOONBASE_ALPHA\""
}

variable "source_chain" {
  type        = string
  description = "Destination testnet name. Can only be \"SEPOLIA\", \"POLYGON_MUMBAI\", \"SCROLL_SEPOLIA\", \"ALFAJORES\", \"FUJI\", \"BSC_TESTNET\", \"MOONBASE_ALPHA\""
}

variable "blockscout_link" {
  type = string
  description = "Appropriate blockscout link for the deployment"
}

variable "golem_address" {
  type = string
  description = "Address of the Golem contract for the destination chain"
}

variable "alchemist_address" {
  type = string
  description = "Address of the Achemist contract for the source chain"
}
