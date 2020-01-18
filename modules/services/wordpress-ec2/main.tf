resource "aws_instance" "ts-example-00" {
  ami                    = "ami-02df9ea15c1778c9c"
  instance_type          = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World 202" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "terraform-infrastructure-example-01"
    Owner = "tstanislawczyk"
    Description = "opis testowy"
  }
  lifecycle {
    create_before_destroy = true
  }

}
resource "aws_security_group" "instance-jenkins" {
  name = "terraform-infrastructure-example"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}