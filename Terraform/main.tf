
# Configure Google Artfact Registry
resource "google_artifact_registry_repository" "docker_repo" {
  project       = var.project_id
  location      = var.region
  repository_id = var.repository_id

  format = "DOCKER"

  description = "Docker Artifact Registry repository"
}

# Create VPC Network for GKE Cluster
resource "google_compute_network" "assignment-vpc-network" {
  name                    = "assignment-vpc-network"
  auto_create_subnetworks = false
}
# Create Subnetwork for GKE Cluster & associate it with VPC Network
resource "google_compute_subnetwork" "assignment-subnetwork" {
  name          = "assignment-subnetwork"
  ip_cidr_range = "10.10.0.0/16"
  region        = var.region
  network       = google_compute_network.assignment-vpc-network.id
}
# Firewall 1 - For internal Communication
resource "google_compute_firewall" "allow-firewall" {
  name    = "internal-firewall"
  network = google_compute_network.assignment-vpc-network.id

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.10.0.0/16"]
}
# Firewall 2 - For external access Access SSH, ICMP, RDP
resource "google_compute_firewall" "allow-internal" {
  name    = "external-firewall"
  network = google_compute_network.assignment-vpc-network.id

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Firewall 3 - For GKE Communication
resource "google_compute_firewall" "allow-gke" {
  name    = "gke-firewall"
  network = google_compute_network.assignment-vpc-network.id

  allow {
    protocol = "tcp"
    ports    = ["443", "10250", "15017"] # 443 - https ,10250 - Kubelet , 15017 - GKE monitoring
  }

  source_ranges = ["0.0.0.0/0"]
}

# GKE Cluster
resource "google_container_cluster" "primary" {
  project  = var.project_id
  name     = "gke-cluster-assignment"
  location = "us-central1-a"


  network                  = google_compute_network.assignment-vpc-network.id
  subnetwork               = google_compute_subnetwork.assignment-subnetwork.id
  min_master_version       = var.K8s_version
  remove_default_node_pool = true
  deletion_protection      = false
  initial_node_count       = 1 # Two node Kubernetes Clusters
}
# GKE Container Node Pool
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name           = "my-node-pool"
  project        = google_container_cluster.primary.project
  cluster        = google_container_cluster.primary.name
  location       = google_container_cluster.primary.location
  version        = var.K8s_version
  node_count     = var.node_count


  node_config {
    image_type   = "UBUNTU_CONTAINERD"
    disk_size_gb = 10
    disk_type    = "pd-standard"
    machine_type = "e2-medium"
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 1
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }

}
