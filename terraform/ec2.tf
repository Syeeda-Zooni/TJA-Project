resource "aws_instance" "my_instance" {
  for_each = var.instances

  ami             = each.value.ami
  instance_type   = each.value.instance_type
  key_name        = aws_key_pair.tja-project-key.key_name
  vpc_security_group_ids = [aws_security_group.tja_project_sg.id]

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
  }

  tags = {
    Name      = each.key
    OSFamily  = each.value.os_family
    ManagedBy = "terraform"
    Project   = "tja-project"
  }

  depends_on = [aws_security_group.tja_project_sg, aws_key_pair.tja-project-key]
}