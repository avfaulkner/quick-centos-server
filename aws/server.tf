resource "aws_instance" "centos" {
  ami           = data.aws_ami.centos.id
  ebs_optimized = false
  instance_type = var.instance_type
  monitoring    = true
  key_name      = var.key_pair
  subnet_id     = aws_subnet.subnet-public.id

  vpc_security_group_ids = [
    aws_security_group.centos-sg.id,
  ]

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_vol_size
  }
}

resource "aws_eip" "centos-eip" {
  vpc      = true
  instance = aws_instance.centos.id
}