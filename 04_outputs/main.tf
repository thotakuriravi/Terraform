
variable "instance_type" {
  type        = string
  description = "In this file i am going to create the tfvar file and saving the variable names in that file"
  
  validation {
    condition = length(var.instance_type) > 4
    error_message = "The instance id must be more than 4 characters."
  }
}

locals {
  project_name = "ravikumar"
}



resource "aws_instance" "terraform123" {
  ami           = "ami-40d28157"
  instance_type = var.instance_type
  tags = {
    Name = "Terraform123-${local.project_name}"
  }
}

#       ${local.project_name}  --> we write for the local variables and
#       #{local/}  --> we write for the path

output "instance_ip_addr" {
  value = aws_instance.terraform123.private_ip
}

