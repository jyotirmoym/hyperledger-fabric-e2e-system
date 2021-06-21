output "crypto_bucket" {
  value = aws_s3_bucket.crypto_bucket.bucket
}

output "iam_role" {
  value = aws_iam_role.fabric_access_role.name
}

output "key_pair" {
  value = aws_key_pair.ec2_key.key_name
}