resource "google_storage_bucket" "artifacts" {
  name     = "${local.name_prefix}-artifacts"
  location = var.region

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  labels = local.common_labels
}
