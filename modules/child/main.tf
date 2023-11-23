resource "null_resource" "config" {
  
  triggers = {
    value = local.child_message
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "${local.child_message}"
    EOT
  }
}
