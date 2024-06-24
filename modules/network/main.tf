resource "aws_db_subnet_group" "this" {
  name       = "db-subnet-group"
  subnet_ids = ["subnet-087b314f5a55f03f8", "subnet-0a110b2d5301d9a86", "subnet-00a48e7c31b641a02"]

  tags = {
    Name = "My DB public subnet group"
  }
}

