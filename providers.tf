terraform {
  required_providers {
    ethereum = {
      source = "ferranbt/ethereum"
      version = "0.1.1"
    }
  }
}

provider "ethereum" {
  host = var.rpc_endpoint
}
