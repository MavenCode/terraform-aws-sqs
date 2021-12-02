# AWS SQS deployment with Terraform

This is a template repository that can be re-used when provisioning amazon simple queue service infrastructure using terraform. Included is an example-module implementation with necessary argument provision documentation for flexibility, and default arguments provided for handling exceptions for a robust module build.

On flexible build, a default default-policy.json file is provided with module that allows complete sqs action configured on module deployment using this policy definition. Custom policy can be imported as a .json file passed to the policy input argument.

See below for user provided variables to customize sqs deployment. Also available in the variables.tf file with the variable type expected.
| Input variables | Description |
| ------------- | ------------- |
| name | name for simple queue service |
| policy | .json file with custom sqs policy, resources, actions, etc defined |
| bucket_arn | if sqs is connected to bucket, bucket.arn value |
| bucket_id | if sqs is connected to bucket, bucket.id value |
| dependency | if sqs is depent on other resources [bucket, notification, ect] |
| tag_name | infrastructure deployment framework -"Terraform" |
| env_name | infrastructure environment; "dev", "test", "prod", "QA" and so on |

Below, the provider requirement for module implementation and the infrastructure provider
| Requirements | |
|:---- | ----:|
|Name | Version |
|terraform | ~> 1.0, latest preferred |
| aws | ~> 3.27, latest preferred |

External values/arguments exported from module, accessible by parent module.
| Outputs variables| Description |
| ------------- | ------------- |
| queue | sqs queue object |
| queue_id | sqs queue unique identifier |
| queue_arn | sqs queue object arn attribute, to subscribe to other services, etc. |
