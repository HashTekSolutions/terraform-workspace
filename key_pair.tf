
resource "tls_private_key" "ec2_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "deployer" {
  key_name   = "${terraform.workspace}-${var.keypair}"
  public_key = tls_private_key.ec2_ssh.public_key_openssh
}

resource "aws_secretsmanager_secret" "key_pair_secret" {
  name = "${terraform.workspace}-${var.secretmanager}"
}

resource "aws_secretsmanager_secret_version" "key_pair_secret_version" {
  secret_id     = aws_secretsmanager_secret.key_pair_secret.id
  secret_string = tls_private_key.ec2_ssh.private_key_pem
}