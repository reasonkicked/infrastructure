resource "aws_instance" "ts-example-00" {
  ami                    = "ami-02df9ea15c1778c9c"
  instance_type          = "t2.micro"
    key_name = "tsjenkins00"
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install hhtpd-y
              apt install php php-mysql -y
              apt install mysql-server-y
              apt install openssh-server
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

resource "aws_key_pair" "default" {
        key_name = "tsjenkins00"
        public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDR4E/K4x9hsLdSMvzSUvQbbPYVTGSLOEFh+9wzeDRn/smQBbQA8MQKu1haLrV1ttO+lWkUaQhfPhWX1RfRnPqCAZChnqpz2ZNUpoDDntHZdLP+VzBYDAzNbWIiybl8ejv1n1Yd1pcd/Z+gpZQv0dj1auVSWiQ5fdxw49Le0XTIBzOHRko1M77WFJu3XYO9930b+tbCvlI7tYDZ9ve25vFf9kd5gLdb9y5sDqM5D8sOAYU8hmRoEl4b2ASw/UZKE9lugEJP+L2YrjcqsSjylvQbsqE2xFCRa7frllbtENEjaEiWTWBYNUJBwCvsEuyKISwKSsLRIKBRPk44zTZHl0AeNHq46PPd4Y1tbpKiGrZXIPjgNJJepFZBUBskriey6u26T9FyfKEu1NLGL2ZwFx+UtyxlBaRUJugr/cR0YsPDz3sUfr4YmoLMYCDVbgdn0+WzvJSaW1sMzkQ6GXkm2N+Kh0h0GhoLu7W6R35Gqgf2YVYlAaav+UW9159p0KdxGRux9EOW0I7E2MRlwJbi3ViV/q8JRRhN3tvpYp8WoJtC/ivuTWS0vFNDKrlcgLnwxq1fJqr++CM1mGjlxnqi7wzsXMh+I4ktxE9u8kZztTD/VuiLScPU8XtisEH7hRTV217pSjFa6eoU44RW6fiuN6LtvSgZ2e44PbvmokdLsUVrbQ== reasonkicked@gmail.com"
}