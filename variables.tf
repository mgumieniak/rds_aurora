variable "name" {
  default = "mgumieniak"
  description = "The Deployment name"
}

variable "environment" {
  default = "test"
  description = "The Deployment environment"
}

variable "db_username" {
  description = "DB username"
  type = string
}

variable "db_password" {
  description = "DB password"
  type = string
}
