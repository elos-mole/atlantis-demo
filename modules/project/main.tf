resource "azuredevops_project" "project" {
  name        = var.project_name
  description = var.project_description
}
