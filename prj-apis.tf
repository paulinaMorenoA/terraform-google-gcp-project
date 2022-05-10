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
  project_apis = concat(var.activate_additional_apis, [
    "compute.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "stackdriver.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iamcredentials.googleapis.com",
    "iap.googleapis.com",
    "cloudkms.googleapis.com",
    "servicemanagement.googleapis.com",
    "servicenetworking.googleapis.com",
    "billingbudgets.googleapis.com",
    "aiplatform.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "storage-component.googleapis.com",
    "storage-api.googleapis.com",
    #
    "cloudfunctions.googleapis.com",
    "sql-component.googleapis.com",
    "accesscontextmanager.googleapis.com",
    "container.googleapis.com",
    "containeranalysis.googleapis.com",
    "serviceusage.googleapis.com",
    "vpcaccess.googleapis.com",
    "secretmanager.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerystorage.googleapis.com",
    "cloudbuild.googleapis.com",
    "composer.googleapis.com",
    "dataproc.googleapis.com",
    "pubsub.googleapis.com",
    "dataflow.googleapis.com",

  ])
}