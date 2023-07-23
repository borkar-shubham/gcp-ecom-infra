terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.74.0"
    }
  }
}

provider "google" {
  project     = "gcp-ecom"
  region      = "us-central1"
  zone = "us-central1-a"
  #credentials = file("~/Users/Shubham/Documents/DevOps/Private_Keys/gcp-ecom-6cc51a911ca6.json")
}