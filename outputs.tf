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

output "svc_project" {
  value = module.vpc_svc_project
}

output "projects_number" {
  description = "Project Numbers."
  value = module.vpc_svc_project["project_number"]
}
  
output "host_project_id" {
  description = "Host project Id"
  value = local.project_apis
}
  
output "grant_services_network_role" {
  description = "Grant Network role"
  value = local.grant_services_network_role
}
