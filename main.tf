data "aws_region" "current-region" {}

data "aws_caller_identity" "this" {}

locals {
  availability_zones = [
    "${data.aws_region.current-region.name}a",
    "${data.aws_region.current-region.name}b",
    "${data.aws_region.current-region.name}c"
  ]
}

module "network" {
  source = "./modules/network"
}

# module "rds" {
#   source = "./modules/rds"
#
#   db_name = "rds"
#   db_username = var.db_username
#   db_password = var.db_password
#   db_subnet_group_name = module.network.db_subnet_group_name
# }

# module "aurora" {
#   source = "./modules/aurora"
#
#   db_username = var.db_username
#   db_password = var.db_password
#   db_subnet_group_name = module.network.db_subnet_group_name
#   replication_source_identifier = module.rds.db_arn
# }

# module "aurora-serverless" {
#   source = "./modules/aurora_servless"
#
#   db_username = var.db_username
#   db_password = var.db_password
#   db_subnet_group_name = module.network.db_subnet_group_name
# #   replication_source_identifier = module.rds.db_arn
# }