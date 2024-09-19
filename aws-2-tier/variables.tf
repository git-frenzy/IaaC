variable "aws_instance_type" {
    description = "Type of instance you want to create?"
    type = string
    validation {
        error_message = "value"
      condition = var.aws_instance_type=="t2.micro"
    }
}

