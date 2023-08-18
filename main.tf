resource "aws_instance" "example" {
  ami                    = "ami-057752b3f1d6c4d6c" # Replace with your desired AMI ID
  instance_type          =  var.instance_type
  key_name               =  aws_key_pair.deployer.key_name # Replace with your key pair name
  vpc_security_group_ids = [aws_security_group.sg_web.id]
  user_data              = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              sudo chmod 777 /usr/share/nginx/html/index.html
              echo 'Welcome to HashTek solutions!' >> /usr/share/nginx/html/index.html
              if [ "${terraform.workspace}" == "dev" ]; then
                echo '<h2>This is the DEV server.</h2>' >> /usr/share/nginx/html/index.html
              elif [ "${terraform.workspace}" == "qa" ]; then
                echo '<h2>This is the QA server.</h2>' >> /usr/share/nginx/html/index.html
              elif [ "${terraform.workspace}" == "prod" ]; then
                echo '<h2>This is the PROD server.</h2>' >> /usr/share/nginx/html/index.html
              else
                echo '<h2>This is a different server.</h2>' >> /usr/share/nginx/html/index.html
               fi
              sudo systemctl restart nginx
              EOF

  tags = {
    Name = "${terraform.workspace}-${var.instance_name}"
  }
}
