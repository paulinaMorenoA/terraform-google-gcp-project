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
  conditional_bindings = var.restricted_iam_admin_users == [] ? [] : module.get-iam-bindings.restricted_iam_admin_bindings
}
module "get-iam-bindings" {
  source                     = "../terraform-google-iam-bindings"
  users_roles_needed         = var.external_users_roles_needed
  restricted_iam_admin_users = var.restricted_iam_admin_users
}

module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  version  = "~> 7.2"
  projects = [module.vpc_svc_project.project_id]
  mode     = "additive"

  bindings             = module.get-iam-bindings.project_role_bindings
  conditional_bindings = local.conditional_bindings
}
