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

locals {
  service_projects = {
    for x in var.service_projects : x.name => x
  }
}

module "svc_projects" {
  source          = "../../"
  for_each        = local.service_projects
  org_id          = var.org_id
  billing_account = var.billing_account

  name                                   = each.value.name
  random_project_id                      = each.value.random_project_id
  shared_vpc_subnets                     = each.value.shared_vpc_subnets
  external_users_roles_needed            = each.value.external_users_roles_needed
  allowed_trusted_image_projects         = each.value.allowed_trusted_image_projects
  activate_additional_apis               = each.value.activate_additional_apis
  labels                                 = each.value.labels
  budget_notification_channel_name       = each.value.budget_notification_channel_name
  budget_notification_channel_project_id = each.value.budget_notification_channel_project_id
  project_alert_spent_percents           = each.value.project_alert_spent_percents
  project_budget_amount                  = each.value.project_budget_amount
  parent_folder_id                       = var.parent_folder_id
  restricted_iam_admin_users             = each.value.restricted_iam_admin_users
  vpc_service_control_attach_enabled     = var.vpc_service_control_attach_enabled
  vpc_service_control_perimeter_name     = var.vpc_service_control_perimeter_name
  access_context_manager_policy_id       = var.access_context_manager_policy_id
}