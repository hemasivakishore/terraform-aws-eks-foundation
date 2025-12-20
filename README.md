# Terraform AWS EKS Foundation

## 📌 Overview

This repository contains a **clean, foundational implementation of an Amazon EKS cluster** provisioned using **Terraform**.

The focus of this project is not feature overload, but **strong Kubernetes and cloud fundamentals** — the way production platforms are built in real organizations.

This repository acts as a **base layer** for future Kubernetes workloads, GitOps, CI/CD, and platform engineering use cases.

---

## 🏗️ Architecture Overview

- Custom AWS VPC
- Public & Private Subnets
- Internet Gateway & NAT Gateway
- IAM Roles & Policies for EKS
- EKS Control Plane
- Managed Node Group (EC2 workers)
- Security Groups with least-privilege access

```text
AWS VPC
├── Public Subnets
│   └── NAT Gateway
├── Private Subnets
│   └── EKS Worker Nodes
├── EKS Control Plane
└── IAM (IRSA-ready)
```
🎯 Design Principles
- Infrastructure as Code (IaC)
- Minimal but production-aligned
- Secure-by-default networking
- Clear separation of control plane and worker nodes
- Extensible for real-world usage

🧰 Tech Stack
- Cloud: AWS
- Container Orchestration: Kubernetes (EKS)
- IaC Tool: Terraform
- Compute: EC2 Managed Node Groups
- Networking: VPC, Subnets, NAT Gateway
- IAM: Role-based access


📂 Repository Structure
```
terraform-aws-eks-foundation/
├── README.md
├── versions.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── vpc.tf
├── iam.tf
├── eks-cluster.tf
├── node-group.tf
├── security-groups.tf
├── terraform.tfvars
└── diagrams/
```

⚙️ Prerequisites
- AWS Account
- AWS CLI configured
- Terraform >= 1.5
- kubectl
- IAM permissions to create EKS, EC2, VPC resources

🔐 Authentication

Ensure AWS credentials are configured:
```
aws configure
```

🚀 How to Use
Initialize Terraform:
```
terraform init
```
Validate configuration:
```
terraform validate
```
Plan infrastructure:
```
terraform plan
```
Apply infrastructure:
```
terraform apply
```
Configure kubectl:
```
aws eks update-kubeconfig --region <region> --name <cluster-name>
```
Verify cluster:
```
kubectl get nodes
```

📖 Concepts Covered
- EKS architecture (control plane vs worker nodes)
- AWS networking for Kubernetes
- IAM roles and trust relationships
- Secure cluster bootstrapping
- Terraform state management
- Reusable and scalable cluster design

🔮 Next Steps (Planned)
- Ingress Controller (ALB)
- Cluster Autoscaler
- IRSA (IAM Roles for Service Accounts)
- GitOps (ArgoCD)
- CI/CD to EKS
- Observability (Prometheus, Grafana)

👨‍💻 Author

V Hema Siva Kishore
SRE | DevOps | Cloud Automation

🔗 LinkedIn: https://linkedin.com/in/hemasivakishore \
🔗 GitHub: https://github.com/hemasivakishore
