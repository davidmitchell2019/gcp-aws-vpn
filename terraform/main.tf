/*
 * Terraform main configuration file (with provider definitions).
 */

provider "google" {
  version = "~> 2.11.0"

  # Should be able to parse project from credentials file but cannot.
  # Cannot convert string to map and cannot interpolate within variables.
  project = "${var.gcp_project_id}"

  region = "${var.gcp_region}"
}


provider "aws" {
  version = "~> 2.19.0"
  region = "${var.aws_region}"
}
