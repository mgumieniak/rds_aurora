data "aws_region" "current-region" {}

data "aws_caller_identity" "this" {}

locals {
  availability_zones = [
    "${data.aws_region.current-region.name}a",
    "${data.aws_region.current-region.name}b",
    "${data.aws_region.current-region.name}c"
  ]
}