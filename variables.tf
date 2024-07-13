variable "signer_mnemonic" {
  type = string
  sensitive = true
}

variable "contract_abi_path" {
  type = string
}

variable "contract_inputs" {
  type = list(string)
}

variable "destination_chain" {
  type = number
}

variable "rpc_endpoint" {
  type = string
}

variable "blockscout_link" {
  type = string
}
