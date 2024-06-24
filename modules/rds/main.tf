resource "aws_db_instance" "this" {
  allocated_storage    = 20
  db_name              = var.db_name
  engine               = "mysql"
  engine_version       = "8.0.35"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = aws_db_parameter_group.this.name

  vpc_security_group_ids  = ["sg-0b93a6a698d1e5d36"]
  db_subnet_group_name    = var.db_subnet_group_name
  availability_zone       = "eu-west-1a"
  multi_az                = false
  publicly_accessible     = true
  backup_retention_period = 1

  skip_final_snapshot = true
  storage_encrypted   = true
  apply_immediately   = true
  deletion_protection = false
}


resource "aws_db_parameter_group" "this" {
  name   = "rds-pg"
  family = "mysql8.0"

  parameter {
    name  = "read_only"
    value = "1"
  }

  lifecycle {
    create_before_destroy = true
  }
}