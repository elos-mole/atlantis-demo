# Parent name
output "parent_name" {
  description = "Parent name"
  value       = var.parent_name
}

# Parent message
output "parent_message" {
  description = "Parent message"
  value       = var.parent_message
}

# Child name
output "child_name" {
  description = "Parent message"
  value       = var.child_name
}

# Child message
output "child_message" {
  description = "Child message"
  value       = local.child_message
}
