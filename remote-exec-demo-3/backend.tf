terraform {
  backend "gcs" {
    bucket = "priya-new-terraform-bucket"
    prefix = "tech_session_demo/gce_vm/demo-3"
  }
}
