# Pollfish DevOps Assignment

A repository created as part of the **Pollfish DevOps Assignment**. This project containerizes a simple Python web app and includes Terraform infrastructure code for cloud provisioning and deployment automation. 

---

##  Project Overview

This repo demonstrates a DevOps-centric solution involving:

- A **Python web application** (`app.py`)
- **Dockerfile** for containerization
- **Terraform** code to provision cloud resources
- Deployment automation using infrastructure-as-code
---

##  Getting Started

###  Prerequisites

Make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Terraform](https://developer.hashicorp.com/terraform)
- Python 3.8+ & `pip`
- Git
- Cloud CLI (e.g., gcloud CLI)

---

 Run Local App
 Docker
 Build Docker Image
docker build -t <image-name> .

 Run Docker Container
docker run -p 8080:8080 <image-name>

 Terraform Infrastructure

Terraform is used to provision cloud infrastructure needed for deployment.

🔹 Initialize Terraform
cd Terraform
terraform init

 Plan Infrastructure
terraform plan

 Apply Configuration
terraform apply

You can test that the service is running by visiting:

http://localhost:8000/

You should see a simple “Hello World” web page

 Deployment Strategy

Build the Docker image locally.

Push to a container registry GKE artifactory

Provision infrastructure with Terraform.

Deploy the container to your target environment that is GKE 



 
