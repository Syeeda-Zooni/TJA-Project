# TJA Project — CI/CD Pipeline with Terraform, Jenkins & Ansible

A complete DevOps project built from scratch as a fresher,
demonstrating end-to-end CI/CD pipeline on AWS.

## Architecture
Developer pushes code to GitHub

│

▼

GitHub Webhook triggers Jenkins

│

▼

Jenkins builds Docker image

│

▼

Jenkins pushes to Docker Hub

│

▼

Jenkins triggers Ansible

│

▼

Ansible deploys app on worker nodes
## Tech Stack

| Tool | Purpose |
|------|---------|
| Terraform | Provision AWS infrastructure |
| Jenkins | CI/CD automation |
| Ansible | Configuration management & deployment |
| Docker | Containerization |
| AWS EC2 | Cloud compute |
| AWS S3 | Terraform remote state |
| AWS DynamoDB | State locking |

## Infrastructure

Provisioned by Terraform:
- 1 Control node — Ubuntu 26.04 (Jenkins + Ansible)
- 1 Worker node — Amazon Linux
- 1 Worker node — Red Hat
- S3 bucket — remote state storage
- DynamoDB table — state locking
- Security group — SSH, HTTP, HTTPS, port 8080

## Project Structure
TJAProject/

├── terraform/        # AWS infrastructure code

├── ansible/          # Playbooks and roles

│   ├── playbooks/    # install_docker.yml, deploy.yml

│   └── roles/        # docker role with OS-specific tasks

├── website/          # Blog website (nginx)

├── Dockerfile        # Containerizes the blog website

├── Jenkinsfile       # CI/CD pipeline definition

└── README.md
## How to Run

### 1. Provision Infrastructure
```bash
cd terraform/backend
terraform init && terraform apply

cd ../
terraform init && terraform apply
```

### 2. Install Docker on all nodes
```bash
ansible-playbook -i inventories/dev/hosts.ini playbooks/install_docker.yml
```

### 3. CI/CD Pipeline
Push code to GitHub — Jenkins automatically builds and deploys.

## Key Learnings

- IAM Roles over access keys for EC2 authentication
- DynamoDB partition key must be exactly `LockID`
- Use private IPs within same VPC for Ansible inventory
- `apt-key` is deprecated on Ubuntu 22.04+ — use `get_url` instead
- Jenkins WAR file installation for unsupported Ubuntu versions

## Author

Zooni | DevOps Fresher | Delhi, India  
AWS Certified Cloud Practitioner  
MCA Student — Amity University