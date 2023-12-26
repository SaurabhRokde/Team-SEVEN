variable "s3_bucket_name" {
  type    = list(string)
  default = ["prodlala", "stagekaka", "qamama","arunpriya","arunsurya","arun3","arun4","arun5","arun6","arun7"]
}

resource "aws_s3_bucket" "hens_bucket" {
  count         = length(var.s3_bucket_name)
  bucket        = var.s3_bucket_name[count.index]
  #acl           = "private"
  force_destroy = true
}
