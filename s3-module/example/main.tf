module "s3_bucket" {
  source      = "github.com/derekdereks/TerraformS3/s3-module?ref=master"  # ref master branch adj as necessary
  bucket_name = "my-example-bucket"

  tags = {
    Owner       = "Derek"
    Environment = "Test"
  }
}

