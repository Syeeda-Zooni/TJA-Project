resource "aws_key_pair" "tja-project-key" {
  key_name   = var.key_name
  public_key = file("tja-project-key.pub")
}