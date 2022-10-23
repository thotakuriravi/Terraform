resource "aws_instance" "terraform" {
  count         = 2
  ami           = "ami-40d28157"
  instance_type = "t2.micro"

  user_data = <<-EOF
                    #!/bin/bash
                    echo "Hello, World" > index.html
                    nohup busybox httpd -f -p 8080 &
                    EOF
  tags = {
    Name = "Terraform"
  }
}