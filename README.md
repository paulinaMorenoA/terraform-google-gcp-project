# License  
Copyright 2021 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.

# Create Project
This Module code will create a project under your the folder along with org policies and IAM permissions. It will also active APIs.

## Compatibility
This code is intended for use with Terraform 1.0.5.
## Providers

| Name | Version |
|------|---------|
| google | n/a |
| terraform | 1.0.0 |

## Usage

Basic usage is as follows for creating project:

```hcl
module my_module_call {
  source                    = "../modules/gcp-svc-project"
  org_id                    = "1234"
  billing_account           = "1234-ABCD-5678"
  name                      = "svc-prj-01"
  random_project_id         = true
  parent_folder_id          = "99999999999"
  
  
  external_users_roles_needed = {
    "group:test-grp-01-poc@example.com"                   = ["poc"]
    "group:test-grp-01-databaseadministrator@example.com" = ["DatabaseAdministrator"]
    "group:test-grp-01-cloudoperations@example.com"       = ["CloudOperations", "NetworkAdministrator"]
  }
  
  allowed_trusted_image_projects = []

  activate_additional_apis = [
    "healthcare.googleapis.com",
    "datafusion.googleapis.com",
    "dataflow.googleapis.com",
    "dataproc.googleapis.com",
    "composer.googleapis.com",
    "pubsub.googleapis.com",
  ]
  
  labels = {
    billing_code    = "1234"
    env             = "vpc_svc_prj"
    primary_contact = "primarycontact"
    business_code   = "my-bu-code"
  }
  
  budget_notification_channel_name       = "my notification Email"
  budget_notification_channel_project_id = "notification_channel_prj"
  
  project_alert_spent_percents = [0.5, 0.75, 0.9, 0.95]
  project_budget_amount        = 100
}

```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_context\_manager\_policy\_id | The ID of the access context manager policy the perimeter lies in. Can be obtained by running `gcloud access-context-manager policies list --organization YOUR_ORGANIZATION_ID --format="value(name)"`. | `string` | n/a | yes |
| activate\_additional\_apis | The list of additional apis to activate within the project | `list(string)` | `[]` | no |
| allowed\_trusted\_image\_projects | List of trusted image projects. If empty marketplace images will be allowed for project | `list(string)` | `[]` | no |
| billing\_account | The ID of the billing account to associate this project with | `string` | n/a | yes |
| budget\_notification\_channel\_name | Name of notification channel | `string` | `null` | no |
| budget\_notification\_channel\_project\_id | Project ID of notification channel | `string` | `null` | no |
| default\_service\_account | Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`. | `string` | `"disable"` | no |
| external\_users\_roles\_needed | Map of external users/groups with roles | `map(list(string))` | `{}` | no |
| labels | Map of labels for project | `map(string)` | `{}` | no |
| name | The name for the project | `string` | n/a | yes |
| org\_id | The organization id for the associated services | `string` | n/a | yes |
| parent\_folder\_id | The name for the parent\_folder | `string` | n/a | yes |
| project\_alert\_spent\_percents | A list of percentages of the budget to alert on when threshold is exceeded for the project | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| project\_budget\_amount | The amount to use as the budget for the project | `number` | `null` | no |
| random\_project\_id | Adds a suffix of 4 random characters to the `project_id` | `bool` | `false` | no |
| restricted\_iam\_admin\_users | List of users with restricted project IAM admin toles | `list(string)` | `[]` | no |
| shared\_vpc\_subnets | List of subnets which will be used by service project | `list(string)` | `[]` | no |
| vpc\_service\_control\_attach\_enabled | Whether the project will be attached to a VPC Service Control Perimeter | `bool` | `false` | no |
| vpc\_service\_control\_perimeter\_name | The name of a VPC Service Control Perimeter to add the created project to | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| svc\_project | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

