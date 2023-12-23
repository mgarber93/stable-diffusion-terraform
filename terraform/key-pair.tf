
resource "aws_key_pair" "ssh-ed25519" {
  key_name   = "ssh-ed25519"
  public_key = var.PUBLIC_KEY 
}
