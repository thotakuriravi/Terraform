variable "instance_type" {
  type        = string
  description = "In this file i am going to create the tfvar file and saving the variable names in that file"

  validation {
    condition = length(var.instance_type) > 4 && substr(var.instance_type, 0, 4)  == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}



resource "aws_instance" "terraform123" {
  ami           = "ami-40d28157"
  instance_type = var.instance_type
  tags = {
    Name = "Terraform123"
  }
}