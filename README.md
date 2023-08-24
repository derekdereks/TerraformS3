# AWS S3 Bucket Terraform Module

This Terraform module provisions a private S3 bucket with features like KMS encryption, logging, versioning, and tags.

![AWS S3 Terraform]

## Table of Contents
- [Prerequisites](#prerequisites)
- [Features](#features)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Testing with Terratest](#testing-with-terratest)


## Prerequisites
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) v0.14+
- [Go](https://golang.org/doc/install) (if you plan to run Terratest)

## Features
- **KMS Encryption**: Provides a KMS key for encryption.
- **S3 Logging**: Bucket logging enabled to track access.
- **Versioning**: Protects against unintended deletes or overwrites.
- **Tags**: Enables better management and cost tracking.

## Usage

Include this module in your Terraform configurations:

```hcl
module "s3_bucket" {
  source      = "github.com/derekdereks/TerraformS3//?ref=master"
  bucket_name = "your_bucket_name"

  tags = {
    Owner       = "your_name"
    Environment = "your_env"
  }
}
```
Then initialize and apply:
```
terraform init
terraform apply

```
## Inputs

| Name         | Description                       | Type         | Default | Required |
|--------------|-----------------------------------|--------------|---------|:--------:|
| bucket_name  | The name of the S3 bucket.        | `string`     | n/a     | yes      |
| tags         | Metadata tags for the S3 bucket.  | `map(string)`| `{}`    | no       |


## Outputs

| Name         | Description                                        |
|--------------|----------------------------------------------------|
| bucket_arn   | The Amazon Resource Number (ARN) of the bucket.    |
| kms_key_arn  | The ARN of the KMS key used for bucket encryption. |

## Terratest Testing
To run Terratest tests (say that five times fast):

Navigate to the test directory:
```
cd test

```
Run the Go test suite:
```
go test -v

```
Ensure you have your AWS credentials set up and the Go runtime installed.


