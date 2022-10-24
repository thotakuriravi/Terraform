
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

