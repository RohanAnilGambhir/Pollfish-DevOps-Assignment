# Pollfish DevOps Assignment

A repository created as part of the **Pollfish DevOps Assignment**. This project containerizes a simple Python web app and includes Terraform infrastructure code for cloud provisioning and deployment automation. 

---

## 🧠 Project Overview

This repo demonstrates a DevOps-centric solution involving:

- A **Python web application** (`app.py`)
- **Dockerfile** for containerization
- **Terraform** code to provision cloud resources
- Deployment automation using infrastructure-as-code
---

## 🚀 Getting Started

### 🎯 Prerequisites

Make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Terraform](https://developer.hashicorp.com/terraform)
- Python 3.8+ & `pip`
- Git

(optional depending on your cloud provider)  
- Cloud CLI (e.g., gcloud CLI)

---

## 📦 Project Structure

Pollfish-DevOps-Assignment/
├── Terraform/ # Terraform IaC
├── app.py # Python web app
├── Dockerfile # Docker config
├── requirements.txt # Python dependencies
└── README.md # Project documentation

🏃 Run Local App
python app.py

🐳 Docker
🧱 Build Docker Image
docker build -t <image-name> .

📤 Run Docker Container
docker run -p 8080:8080 <image-name>

⚙️ Terraform Infrastructure

Terraform is used to provision cloud infrastructure needed for deployment.

🔹 Initialize Terraform
cd Terraform
terraform init

📊 Plan Infrastructure
terraform plan

☁️ Apply Configuration
terraform apply


⚠️ You may need cloud provider credentials exported as environment variables before running Terraform.

🧪 Testing

You can test that the service is running by visiting:

http://localhost:8000/

You should see a simple “Hello World” or custom response depending on app.py.

🛠 Deployment Strategy

Build the Docker image locally.

Push to a container registry .

Provision infrastructure with Terraform.

Deploy the container to your target environment (cloud provider).

Note: Update Terraform provider blocks based on your cloud platform (GCP, AWS, Azure etc.).

 Dependencies

Python:

Listed in requirements.txt

Terraform:

Provider blocks and modules go under the Terraform/ directory.

 Author

Rohan Anil Gambhir

GitHub: https://github.com/RohanAnilGambhir/Pollfish-DevOps-Assignment
