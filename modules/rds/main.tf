resource "aws_db_instance" "this" {
  allocated_storage    = 20
  db_name              = "rds"
  engine               = "mysql"
  engine_version       = "8.0.35"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"

  vpc_security_group_ids = ["sg-0b93a6a698d1e5d36"]
  db_subnet_group_name = aws_db_subnet_group.this.name
  availability_zone = "eu-west-1a"
  multi_az = false
  publicly_accessible = true

  skip_final_snapshot  = true
  storage_encrypted    = true
}

resource "aws_db_subnet_group" "this" {
  name       = "db-subnet-group"
  subnet_ids = ["subnet-087b314f5a55f03f8", "subnet-0a110b2d5301d9a86", "subnet-00a48e7c31b641a02"]

  tags = {
    Name = "My DB public subnet group"
  }
}

