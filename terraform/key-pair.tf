
resource "aws_key_pair" "ssh" {
  key_name   = "ssh"
  public_key = var.PUBLIC_KEY
}