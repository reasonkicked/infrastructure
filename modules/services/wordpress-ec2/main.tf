resource "aws_instance" "ts-example-00" {
  ami                    = "ami-02df9ea15c1778c9c"
  instance_type          = "t2.micro"
    key_name = "${var.ami_key_pair_name}"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install hhtpd-y
              apt install php php-mysql -y
              apt install mysql-server-y
              service httpd start
              service mysqld start
              mysqladmin -uroot create mydb
              cd /var/www/html
              wget http://wordpress.org/latest.tar.gz
              tar -xzf latest.tar.gz
              mv wordpress/ testwordpress
              cd testwordpress
              mv wp-config-sample.php wp-config.php             
              EOF

  tags = {
    Name = "${var.ec2_instance_name}-instance"
    Owner = "tstanislawczyk"
    Description = "opis testowy"
  }
  lifecycle {
    create_before_destroy = true
  }
}

/* echo "Hello, World 202" > index.html
              nohup busybox httpd -f -p 8080 & */
/* resource "aws_security_group" "instance-jenkins" {
  name = "terraform-wordpress-ec2-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
*/