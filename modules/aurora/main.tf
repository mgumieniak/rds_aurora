locals {
  replication_source_identifier = var.replication_source_identifier == null ? null : var.replication_source_identifier
}

resource "aws_rds_cluster" "this" {
  allocated_storage         = null
  db_cluster_instance_class = null

  cluster_identifier = "aurora-cluster-mysql"
  engine_mode        = "provisioned"
  engine             = "aurora-mysql"
  engine_version     = "8.0.mysql_aurora.3.07.0"

  replication_source_identifier = local.replication_source_identifier

  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  vpc_security_group_ids      = ["sg-0b93a6a698d1e5d36"]
  storage_encrypted           = true
  skip_final_snapshot         = true
  allow_major_version_upgrade = false
  apply_immediately           = true
  copy_tags_to_snapshot       = true
  deletion_protection         = true

  master_username = var.db_username
  master_password = var.db_password

  backup_retention_period = 1
  db_subnet_group_name    = var.db_subnet_group_name
#   storage_type            = "gp3"  -- faluje sprawdzicc
  #   enable_local_write_forwarding = true

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  identifier_prefix   = "first"
  cluster_identifier  = aws_rds_cluster.this.id
  instance_class      = "db.t3.medium"
  engine              = "aurora-mysql"
  engine_version      = "8.0.mysql_aurora.3.07.0"
  apply_immediately   = true
  publicly_accessible = true

  lifecycle {
    prevent_destroy = true
  }
}