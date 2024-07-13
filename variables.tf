variable "signer_mnemonic" {
  type      = string
  sensitive = true
}

variable "contract_abi_path" {
  type = string
}

variable "contract_inputs" {
  # type = list(object({ type_ = string, value = any }))
  type = any
}

variable "destination_chain" {
  type        = string
  description = "Destination testnet name. Can only be \"SEPOLIA\", \"POLYGON_MUMBAI\", \"SCROLL_SEPOLIA\", \"ALFAJORES\", \"FUJI\", \"BSC_TESTNET\", \"MOONBASE_ALPHA\""
}

variable "source_chain" {
  type = string
}

variable "blockscout_link" {
  type = string
}

variable "golem_address" {
  type = string
}

variable "alchemist_address" {
  type = string
}
