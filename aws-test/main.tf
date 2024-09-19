resource "random_id" "rand_id" {
  byte_length = 4
}


resource "aws_s3_bucket" "tf-bucket" {
  bucket = "kanishksuri-${random_id.rand_id.hex}"
  lifecycle {
    prevent_destroy = false
  }
}

