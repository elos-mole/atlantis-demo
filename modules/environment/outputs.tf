# Project Id
output "project_id" {
  description = "Project Id"
  value       = var.project_id
}

# Environment Id
output "environment_id" {
  description = "Environment Id"
  value       = azuredevops_environment.environment.id
}
