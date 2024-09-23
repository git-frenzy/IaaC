locals {
  users_data = yamldecode(file("./users.yaml")).users
}

output "output" {
  value = local.users_data[*].username
}

// creating users

# resource "aws_iam_user" "main" {
# }
