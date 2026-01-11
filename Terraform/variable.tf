variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "assignment-483814"
}
variable "region" {
  type        = string
  description = "GCP Region"
  default     = "us-central1"
}
variable "zone" {
  type        = string
  description = "GCP Zone"
  default     = "us-central1-a"
}
variable "K8s_version" {
  description = "this is the gke version"
  type        = string
  default     = "1.33.5-gke.1308000"
}
variable "node_count" {
  description = "Number of Nodes"
  type        = number
  default     = 2

}

variable "repository_id" {
  type        = string
  description = "Artifact Registry repository name"
  default     = "gcp-artifact-repo"
}
