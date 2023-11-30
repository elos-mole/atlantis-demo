data "azuredevops_project" "project" {
  project_id = var.project_id
}

data "azuredevops_git_repository" "configuration" {
  project_id = var.project_id
  name       = "gitops-configuration"
}

data "azuredevops_project" "iacproject" {
  name = "iac"
}

data "azuredevops_git_repository" "argoapps" {
  project_id = data.azuredevops_project.iacproject.id
  name       = "argo-apps"
}

resource "azuredevops_environment" "environment" {
  project_id  = var.project_id
  name        = var.environment_name
  description = var.environment_description
}

resource "azuredevops_git_repository_file" "gitkeep" {
  repository_id       = data.azuredevops_git_repository.configuration.id
  file                = "${var.environment_name}/.gitkeep"
  content             = ""
  branch              = "refs/heads/master"
  commit_message      = "IaC Provisioning"
  overwrite_on_create = true
}

resource "azuredevops_git_repository_file" "argoapp" {
  repository_id       = data.azuredevops_git_repository.argoapps.id
  file                = "${data.azuredevops_project.project.name}-${var.environment_name}.yaml"
  content             = <<EOF
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: ${data.azuredevops_project.project.name}-${var.environment_name}
  namespace: openshift-gitops
spec:
  project: default
  source:
    repoURL: ${data.azuredevops_git_repository.configuration.remote_url}
    targetRevision: master
    path: ${var.environment_name}
  destination:
    server: https://kubernetes.default.svc
    namespace: ${data.azuredevops_project.project.name}-${var.environment_name}
  syncPolicy:
    syncOptions:
      - CreateNamespace=true
EOF
  branch              = "refs/heads/main"
  commit_message      = "IaC Provisioning"
  overwrite_on_create = true
}