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
  #host_project_id             = length(var.shared_vpc_subnets) > 0 ? element(split("/", element(var.shared_vpc_subnets, 0)), 1) : var.svpc_host_project_id
  #grant_services_network_role = length(var.shared_vpc_subnets) > 0 ? true : true
  host_project_id             = (var.svpc_host_project_id != null) ? var.svpc_host_project_id : (length(var.shared_vpc_subnets) > 0 ? element(split("/", element(var.shared_vpc_subnets, 0)), 1) : "")
  grant_services_network_role = length(var.shared_vpc_subnets) > 0 ? true : (var.svpc_host_project_id != null) ? true : false
  shared_vpc_subnets          = length(var.shared_vpc_subnets) > 0 ? var.shared_vpc_subnets : null
  notification_channel        = (var.budget_notification_channel_name == null && var.budget_notification_channel_project_id == null) ? 0 : 1
  notification_channel_name   = local.notification_channel == 1 ? [data.google_monitoring_notification_channel.notification_channel[0].name] : []
}

data "google_monitoring_notification_channel" "notification_channel" {
  count        = local.notification_channel
  display_name = var.budget_notification_channel_name
  project      = var.budget_notification_channel_project_id
}

module "vpc_svc_project" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 11.1"
  random_project_id           = var.random_project_id
  name                        = var.name
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = var.parent_folder_id
  disable_services_on_destroy = false
  auto_create_network         = false
  activate_apis               = local.project_apis
  default_service_account     = var.default_service_account


  labels = var.labels

  budget_alert_spent_percents             = var.project_alert_spent_percents
  budget_amount                           = var.project_budget_amount
  budget_monitoring_notification_channels = local.notification_channel_name

  svpc_host_project_id               = local.host_project_id
  grant_services_network_role        = local.grant_services_network_role
  shared_vpc_subnets                 = var.shared_vpc_subnets
  vpc_service_control_attach_enabled = var.vpc_service_control_attach_enabled
  vpc_service_control_perimeter_name = "accessPolicies/${var.access_context_manager_policy_id}/servicePerimeters/${var.vpc_service_control_perimeter_name}"
}

