/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "org_id" {
  description = "The organization id for the associated services"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}


variable "terraform_service_account" {
  description = "Service account email of the account to impersonate to run Terraform."
  type        = string
}

variable "parent_folder_id" {
  description = "The name for the parent_folder"
  type        = string
}

variable "service_projects" {
  description = "List of service projects."
  type = list(object({
    name                                   = string
    random_project_id                      = bool
    shared_vpc_subnets                     = list(string)
    external_users_roles_needed            = map(list(string))
    restricted_iam_admin_users             = list(string)
    allowed_trusted_image_projects         = list(string)
    activate_additional_apis               = list(string)
    labels                                 = map(string)
    budget_notification_channel_name       = string
    budget_notification_channel_project_id = string
    project_alert_spent_percents           = list(string)
    project_budget_amount                  = number
  }))
}

variable "vpc_service_control_attach_enabled" {
  description = "Whether the project will be attached to a VPC Service Control Perimeter"
  type        = bool
  default     = false
}

variable "vpc_service_control_perimeter_name" {
  description = "The name of a VPC Service Control Perimeter to add the created project to"
  type        = string
  default     = null
}

variable "access_context_manager_policy_id" {
  type        = string
  description = "The ID of the access context manager policy the perimeter lies in. Can be obtained by running `gcloud access-context-manager policies list --organization YOUR_ORGANIZATION_ID --format=\"value(name)\"`."
}

