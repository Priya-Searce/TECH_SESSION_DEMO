project_id     = "searce-playground-v1"
network        = "priya-vpc"
subnetwork     = "priya-public-subnet"
region         = "asia-east1"  
zone           = "asia-east1-a"
instance_name  = "priya-new-tf-vm-3"
machine_type   = "f1-micro"
instance_image = "centos-cloud/centos-7"
user = "priya_soni_searce_com"
labels = {
    "owner" = "priya_soni"
  }