terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_name
}

resource "google_storage_bucket" "storage_bucket" {
  name     = var.bucket_name
  location = "us-central1"

  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  labels = {
    created-by = "controlmonkey-template"
  }
}

variable "project_name" {
  description = "The name of the GCP project."
  type        = string
}

variable "bucket_name" {
  description = "The name of the GCP Storage Bucket to create."
  type        = string
}