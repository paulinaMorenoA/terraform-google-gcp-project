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
  trusted_image_projects = concat(var.allowed_trusted_image_projects,
    [
      "serverless-vpc-access-images", ### Needed for serverless VPC access connectror
      "cloud-dataproc"                ### Needed for dataproc clusters
    ]
  )
}
module "restrict_shared_vpc_subnets" {
  source            = "terraform-google-modules/org-policy/google"
  version           = "~> 5.0"
  project_id        = module.vpc_svc_project.project_id
  policy_for        = "project"
  constraint        = "constraints/compute.restrictSharedVpcSubnetworks"
  policy_type       = "list"
  allow             = var.shared_vpc_subnets
  allow_list_length = length(var.shared_vpc_subnets)
}

module "allowed_trusted_image_projects" {
  count             = length(var.allowed_trusted_image_projects) > 0 ? 1 : 0
  source            = "terraform-google-modules/org-policy/google"
  project_id        = module.vpc_svc_project.project_id
  policy_for        = "project"
  constraint        = "constraints/compute.trustedImageProjects"
  policy_type       = "list"
  allow             = formatlist("projects/%s", local.trusted_image_projects)
  allow_list_length = length(local.trusted_image_projects)
}
