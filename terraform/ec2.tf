data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_spot_instance_request" "stable_diffusion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.EC2_INSTANCE_TYPE
  spot_price                  = var.EC2_INSTANCE_SPOT_PRICE
  subnet_id                   = var.SUBNET_ID
  spot_type                   = "one-time"
  wait_for_fulfillment        = true
  associate_public_ip_address = true
  key_name = aws_key_pair.ssh.key_name

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.EC2_INSTANCE_DISK_SIZE
    encrypted             = false
    delete_on_termination = true
  }

  vpc_security_group_ids = [
    aws_security_group.stable_diffusion.id
  ]

  tags = {
    Name = "stable-diffusion"
  }

  user_data = <<EOF
#!/usr/bin/env bash
su - ubuntu -c "cd /home/ubuntu && git clone https://github.com/mgarber93/stable-diffusion-terraform"
su - ubuntu -c "/home/ubuntu/stable-diffusion-terraform/scripts/setup.sh"
EOF
}