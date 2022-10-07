provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "tls" {
  // no config needed
}
