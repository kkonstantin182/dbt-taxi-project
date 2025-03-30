terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
}


resource "google_bigquery_dataset" "just-another_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}