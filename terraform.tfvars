# Application Definition 
app_name        = "kopicloud" #do NOT enter any spaces
app_environment = "test" # Dev, Test, Prod, etc
app_domain      = "kopicloud.com"
app_project     = "kopicloud"
app_node_count  = 2

# GCP Settings
gcp_region_1  = "europe-west1"
gcp_zone_1    = "europe-west1-b"
gcp_auth_file = "../auth/kopicloud-tfadmin.json"

# GCP Netwok
private_subnet_cidr_1  = "10.10.1.0/24"
