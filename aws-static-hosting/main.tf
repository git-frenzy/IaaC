resource "random_id" "rand_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "website-bucket" {
  bucket = "kanishksuri-${random_id.rand_id.hex}"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_object" "html-upload" {
  bucket = aws_s3_bucket.website-bucket.bucket
  source = "./static-website/index.html"
  key    = "index.html"
  content_type = "text/html"
}
resource "aws_s3_object" "css-upload" {
  bucket = aws_s3_bucket.website-bucket.bucket
  source = "./static-website/styles.css"
  key    = "styles.css"
  content_type = "text/css"
}

resource "aws_s3_bucket_public_access_block" "public-access" {
  bucket                  = aws_s3_bucket.website-bucket.bucket
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "public-read-policy" {
  bucket = aws_s3_bucket.website-bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.website-bucket.arn}/*"
      }
    ]
  })
}
