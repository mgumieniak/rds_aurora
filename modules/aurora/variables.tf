variable "db_username" {
  description = "DB username"
  type = string
}

variable "db_password" {
  description = "DB password"
  type = string
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type = string
}

variable "replication_source_identifier" {
  description = "ARN of a source DB cluster or DB instance"
  default = ""
}
