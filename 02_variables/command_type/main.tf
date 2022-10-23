
variable "instance_type" {
  type        = string
  default     = ""
  description = "Creating the variable for the instance type"

  validation {
    condition = length(var.instance_type) > 4 && substr(var.instance_type, 0, 4)  == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}


resource "aws_instance" "terraform" {
  count         = 2
  ami           = "ami-40d28157"
  instance_type = var.instance_type

  user_data = <<-EOF
                    #!/bin/bash
                    echo "Hello, World" > index.html
                    nohup busybox httpd -f -p 8080 &
                    EOF
  tags = {
    Name = "Terraform"
  }
}