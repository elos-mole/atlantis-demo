include "project" {
  path = find_in_parent_folders("environment.hcl")
}

inputs = {
  environment_description = "DEV environment"
}  
