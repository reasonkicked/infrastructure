resource "aws_instance" "ts-example-00" {
  ami                    = "ami-02df9ea15c1778c9c"
  instance_type          = "t2.micro"
    key_name = "ts-aws-3"
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
              tar - xzf latest.tar.gz
              mv wordpress/ testwordpress
              cd testwordpress
              mv wp-config-sample.php wp-config.php
              EOF

  tags = {
    Name = "wordpress-ec2-02-instance"
    Owner = "tstanislawczyk"
    Description = "opis testowy"
  }
  lifecycle {
    create_before_destroy = true
  }
}
