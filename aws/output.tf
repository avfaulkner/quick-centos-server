output "centos_instance" {
  value = {
    instance_name = var.instance_name
    id            = aws_instance.centos.id
    private_ip    = aws_instance.centos.private_ip

    private_dns = aws_instance.centos.private_dns

    public_ip = aws_eip.centos-eip.public_ip
  }
}
