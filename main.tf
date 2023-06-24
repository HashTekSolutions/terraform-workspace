resource "aws_instance" "example" {
  ami                    = "ami-057752b3f1d6c4d6c" # Replace with your desired AMI ID
  instance_type          = "t2.micro"
  key_name   = "${terraform.workspace}-${var.keypair}" # Replace with your key pair name
  vpc_security_group_ids = [aws_security_group.sg_web.id]

  tags = {
    Name = "${terraform.workspace}-${var.instance_name}"
  }
}
