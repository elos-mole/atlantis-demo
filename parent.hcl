locals{
  parent_name     = basename(path_relative_to_include())
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

terraform {
  # Workaround for https://github.com/gruntwork-io/terragrunt/issues/1675
  source = "${path_relative_from_include()}//modules/parent"
}

inputs = {
  parent_name = local.parent_name
}
