provider "google" {
#   version = "= 3.55.0"
  credentials = var.sa_key
  #project = var.project_id
}
 
variable "sa_key" {
  default =  ""
}
 
# resource "google_storage_bucket_iam_binding" "binding" {
#   bucket = "test-secret-rotation-fuction"
#   #project = "parabolic-base-409505"
#   role = "roles/storage.legacyBucketOwner"
#   members = [
#     "user:jane@example.com",
#   ]
# }
 
resource "google_storage_bucket" "auto-expire" {
  name          = "no-public-access-bucket2463"
  location      = "US"
  force_destroy = true
   retention_policy {
     retention_period = 2145724
     is_locked = true
   }
  #public_access_prevention = "enforced"
  #encryption {
  #  default_kms_key_name = "projects/parabolic-base-409505/locations/us-central1/keyRings/secret-keyring/cryptoKeys/secret-key"
  #}
}
