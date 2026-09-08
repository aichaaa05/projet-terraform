output "web_public_ips" {
  description = "Adresses IP publiques des machines web"
  value = {
    for index, vm in google_compute_instance.web :
    vm.name => vm.network_interface[0].access_config[0].nat_ip
  }
}

output "bucket_name" {
  description = "Nom du bucket d'artefacts"
  value       = google_storage_bucket.artifacts.name
}

output "service_account_email" {
  description = "Adresse e-mail du compte de service dédié"
  value       = google_service_account.web.email
}
