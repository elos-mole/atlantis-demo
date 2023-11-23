locals{
  child_name     = basename(path_relative_to_include())
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket  = "elos-atlantis-demo"
    region  = "eu-north-1"
    key     = "${path_relative_to_include()}/terraform.tfstate"
  }
}
EOF
}

dependency "parent" {
  config_path = "../../"
}

terraform {
  # Workaround for https://github.com/gruntwork-io/terragrunt/issues/1675
  source = "${path_relative_from_include()}//modules/child"
}

inputs = {
  child_name        = local.child_name
  parent_name      = dependency.parent.outputs.parent_name
  parent_message   = dependency.parent.outputs.parent_message
}
