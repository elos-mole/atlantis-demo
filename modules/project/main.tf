resource "azuredevops_project" "project" {
  name        = var.project_name
  description = var.project_description
}

resource "azuredevops_git_repository" "configuration" {
  project_id = azuredevops_project.project.id
  name       = "gitops-configuration"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    ignore_changes = [
      initialization
    ]
  }
}
