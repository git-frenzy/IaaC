resource "random_id" "rand_id" {
  byte_length = 4
}


resource "aws_s3_bucket" "tf-bucket" {
  bucket = "kanishksuri-${random_id.rand_id.hex}"
    lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.tf-bucket.bucket
  source = "./file.txt"
  key    = "this-is-my-file.txt"
}

