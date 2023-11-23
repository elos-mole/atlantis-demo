resource "null_resource" "config" {
  
  triggers = {
    value = local.parent_message
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "${local.parent_message}"
    EOT
  }
}
