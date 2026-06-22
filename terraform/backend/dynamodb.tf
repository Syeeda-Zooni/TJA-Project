resource "aws_dynamodb_table" "tja-project-dynamodb-table" {
  name           = "tja-project-dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "tja-project-dynamodb-table"
  }
}