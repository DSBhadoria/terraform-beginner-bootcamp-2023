# This is my first change!
# This is my second change!

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
# resource "random_string" "bucket_name" {
#   lower   = true
#   upper   = false
#   length  = 32
#   special = false
# }

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  index_html_path = var.index_html_path
  error_html_path = var.error_html_path
}
