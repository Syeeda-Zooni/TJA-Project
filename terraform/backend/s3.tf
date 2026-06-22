resource "aws_s3_bucket" "tja-project-s3" {
  bucket = "tja-project-s3"

  tags = {
    Name        = "tja-project-s3"
  }
}