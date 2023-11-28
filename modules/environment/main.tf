# data "azuredevops_project" "project" {
#   project_id = var.project_id
# }

resource "azuredevops_environment" "environment" {
  project_id  = var.project_id
  name        = var.environment_name
  description = var.environment_description
}
