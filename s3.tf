resource "aws_s3_bucket" "root" {
  bucket = "piotr-leszczynski-big-data-solutions"
}

resource "aws_s3_object" "terraform_backend_folder" {
  bucket  = aws_s3_bucket.root.id
  key     = "state/"
  content = "Terraform backend"
}

# resource "aws_s3_bucket_policy" "storage_policy" {
#   bucket = aws_s3_bucket.root.id
#   policy = data.aws_iam_policy_document.storage_policy_doc.json
# }

# data "aws_iam_policy_document" "storage_policy_doc" {
#   statement {
#     actions   = ["s3:ListBucket"]
#     resources = ["arn:aws:s3:::piotr-leszczynski-big-data-solutions"]
#     effect    = "Allow"
#     principals {
#       type        = "AWS"
#       identifiers = ["544385058064"]
#     }
#   }
# }