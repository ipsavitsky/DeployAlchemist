# DeployAlchemist TF module
This is the main DeployAlchemist terraform module for interacting with DeployAlchemist cross-chain deployment infrastructure. 

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ethereum"></a> [ethereum](#requirement\_ethereum) | 0.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ethereum"></a> [ethereum](#provider\_ethereum) | 0.1.1 |

## Resources

| Name | Type |
|------|------|
| [ethereum_contract_deployment.deploy](https://registry.terraform.io/providers/ferranbt/ethereum/0.1.1/docs/resources/contract_deployment) | resource |
| [ethereum_eoa.signer_account](https://registry.terraform.io/providers/ferranbt/ethereum/0.1.1/docs/data-sources/eoa) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_blockscout_link"></a> [blockscout\_link](#input\_blockscout\_link) | n/a | `string` | n/a | yes |
| <a name="input_contract_abi_path"></a> [contract\_abi\_path](#input\_contract\_abi\_path) | n/a | `string` | n/a | yes |
| <a name="input_contract_inputs"></a> [contract\_inputs](#input\_contract\_inputs) | n/a | `list(string)` | n/a | yes |
| <a name="input_rpc_endpoint"></a> [rpc\_endpoint](#input\_rpc\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_signer_mnemonic"></a> [signer\_mnemonic](#input\_signer\_mnemonic) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_blockscout_link"></a> [blockscout\_link](#output\_blockscout\_link) | n/a |
