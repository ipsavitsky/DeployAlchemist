terraform {
  required_providers {
    ethereum = {
      source = "hashicorp.com/ilyasavitsky/ethereum"
      version = "0.1.1"
    }
  }
}

provider "ethereum" {
  host = var.rpc_endpoint
}
