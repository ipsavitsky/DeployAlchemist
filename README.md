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
| <a name="provider_external"></a> [external](#provider\_external) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ethereum_transaction.deploy](https://registry.terraform.io/providers/ferranbt/ethereum/0.1.1/docs/resources/transaction) | resource |
| [ethereum_transaction.get_quote](https://registry.terraform.io/providers/ferranbt/ethereum/0.1.1/docs/resources/transaction) | resource |
| [null_resource.fee_trigger](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_bytes.salt](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/bytes) | resource |
| [ethereum_call.get_quote](https://registry.terraform.io/providers/ferranbt/ethereum/0.1.1/docs/data-sources/call) | data source |
| [ethereum_eoa.signer_account](https://registry.terraform.io/providers/ferranbt/ethereum/0.1.1/docs/data-sources/eoa) | data source |
| [external_external.calculate_abi](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.calculate_additional_data](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [local_file.contract](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alchemist_address"></a> [alchemist\_address](#input\_alchemist\_address) | Address of the Achemist contract for the source chain | `string` | n/a | yes |
| <a name="input_blockscout_link"></a> [blockscout\_link](#input\_blockscout\_link) | Appropriate blockscout link for the deployment | `string` | n/a | yes |
| <a name="input_contract_abi_path"></a> [contract\_abi\_path](#input\_contract\_abi\_path) | A file path to the JSON ABI of the contract | `string` | n/a | yes |
| <a name="input_contract_inputs"></a> [contract\_inputs](#input\_contract\_inputs) | A list of maps of input parameters for deployed smart contracts. | `list(object({ type_ = string, value = any }))` | n/a | yes |
| <a name="input_destination_chain"></a> [destination\_chain](#input\_destination\_chain) | Destination testnet name. Can only be "SEPOLIA", "POLYGON\_MUMBAI", "SCROLL\_SEPOLIA", "ALFAJORES", "FUJI", "BSC\_TESTNET", "MOONBASE\_ALPHA" | `string` | n/a | yes |
| <a name="input_golem_address"></a> [golem\_address](#input\_golem\_address) | Address of the Golem contract for the destination chain | `string` | n/a | yes |
| <a name="input_signer_mnemonic"></a> [signer\_mnemonic](#input\_signer\_mnemonic) | A mnemonic phrase for the signer wallet on the source chain | `string` | n/a | yes |
| <a name="input_source_chain"></a> [source\_chain](#input\_source\_chain) | Destination testnet name. Can only be "SEPOLIA", "POLYGON\_MUMBAI", "SCROLL\_SEPOLIA", "ALFAJORES", "FUJI", "BSC\_TESTNET", "MOONBASE\_ALPHA" | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gas_quote"></a> [gas\_quote](#output\_gas\_quote) | The amount of gas that was quoted by Hyperlane for the cross chain transaction |
