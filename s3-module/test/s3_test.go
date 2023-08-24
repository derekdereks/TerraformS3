package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestTerraformS3Bucket(t *testing.T) {
    t.Parallel()

    terraformOptions := &terraform.Options{
        TerraformDir: "../example",
        NoColor: true,
    }

    defer terraform.Destroy(t, terraformOptions)

    terraform.InitAndApply(t, terraformOptions)

    bucketArn := terraform.Output(t, terraformOptions, "bucket_arn")
    assert.Contains(t, bucketArn, "my-example-bucket")

    kmsKeyArn := terraform.Output(t, terraformOptions, "kms_key_arn")
    assert.Contains(t, kmsKeyArn, "arn:aws:kms:")
}
