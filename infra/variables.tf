variable "project_id" {
  description = "Identifiant du projet Google Cloud"
  type        = string
}

variable "region" {
  description = "Région Google Cloud"
  type        = string
}

variable "zone" {
  description = "Zone Google Cloud utilisée pour les machines"
  type        = string
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "L'environnement doit être dev, test ou prod."
  }
}

variable "prefix" {
  description = "Préfixe unique utilisé pour nommer les ressources"
  type        = string
}

variable "machine_type" {
  description = "Type de machine Compute Engine"
  type        = string
}

variable "instance_count" {
  description = "Nombre de machines web"
  type        = number
}
