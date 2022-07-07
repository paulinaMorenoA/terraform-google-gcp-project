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

variable "shared_vpc_subnets" {
  description = "List of subnets which will be used by service project"
  type        = list(string)
  default     = []
}
   
variable "svpc_host_project_id" {
  description = "The ID of the host project which hosts the shared VPC"
  type        = string
  default     = ""
}

variable "external_users_roles_needed" {
  description = "Map of external users/groups with roles"
  type        = map(list(string))
  default     = {}
}

variable "restricted_iam_admin_users" {
  description = "List of users with restricted project IAM admin toles"
  type        = list(string)
  default     = []
}

variable "allowed_trusted_image_projects" {
  description = "List of trusted image projects. If empty marketplace images will be allowed for project"
  type        = list(string)
  default     = []
}

variable "activate_additional_apis" {
  description = "The list of additional apis to activate within the project"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Map of labels for project"
  type        = map(string)
  default     = {}
}

variable "project_alert_spent_percents" {
  description = "A list of percentages of the budget to alert on when threshold is exceeded for the project"
  type        = list(number)
  default     = [0.5, 0.75, 0.9, 0.95]
}

variable "project_budget_amount" {
  description = "The amount to use as the budget for the project"
  type        = number
  default     = null
}

variable "budget_notification_channel_name" {
  type        = string
  description = "Name of notification channel"
  default     = null
}

variable "budget_notification_channel_project_id" {
  type        = string
  description = "Project ID of notification channel"
  default     = null
}

variable "name" {
  description = "The name for the project"
  type        = string
}

variable "random_project_id" {
  description = "Adds a suffix of 4 random characters to the `project_id`"
  type        = bool
  default     = false
}

variable "default_service_account" {
  description = "Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`."
  default     = "disable"
  type        = string
}

variable "parent_folder_id" {
  description = "The name for the parent_folder"
  type        = string
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
