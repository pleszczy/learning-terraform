resource "aws_s3_bucket" "root" {
  bucket = "piotr-leszczynski-big-data-solutions"
}

resource "aws_s3_object" "terraform_backend_folder" {
  bucket  = aws_s3_bucket.root.id
  key     = "state/"
  content = "Terraform backend"
}