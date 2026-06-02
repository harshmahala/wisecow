## Problem Statement 2

### 1. System Health Monitoring Script
Location:
scripts/system_health.sh

Checks:
- CPU Usage
- Memory Usage
- Disk Usage

### 2. Application Health Checker
Location:
scripts/app_health.sh

Checks application health using HTTP status codes.# Wisecow Application - Containerization & Kubernetes Deployment

## Project Overview

This project demonstrates the containerization and deployment of the Wisecow application on Kubernetes as part of the AccuKnox DevOps Trainee Practical Assessment.

The application serves random wisdom messages using `fortune` and `cowsay` over an HTTP endpoint.

Repository:
https://github.com/harshmahala/wisecow

---

## Project Structure

```bash
wisecow/
│
├── Dockerfile
├── wisecow.sh
├── README.md
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── scripts/
│   ├── app_health.sh
│   └── system_health.sh
│
└── .github/
    └── workflows/
        └── ci-cd.yml
```

---

# Problem Statement 1

## Dockerization

A Docker image was created for the Wisecow application using a custom Dockerfile.

### Build Image

```bash
docker build -t wisecow:v1 .
```

### Run Container

```bash
docker run -d -p 4499:4499 --name wisecow-container wisecow:v1
```

### Verify Container

```bash
docker ps
```

Expected Output:

```bash
0.0.0.0:4499->4499/tcp
```

---

## Kubernetes Deployment

The application was deployed on a Minikube Kubernetes cluster.

### Deploy Application

```bash
kubectl apply -f k8s/deployment.yaml
```

### Create Service

```bash
kubectl apply -f k8s/service.yaml
```

### Verify Pods

```bash
kubectl get pods
```

### Verify Services

```bash
kubectl get svc
```

---

## Kubernetes Service Exposure

The application is exposed using a NodePort service.

### Access Service

```bash
minikube service wisecow-service
```

or

```bash
kubectl get svc
```

Use the displayed NodePort URL.

---

## Continuous Integration / Continuous Deployment

GitHub Actions workflow has been implemented.

### Workflow Features

- Automatic build on push
- Docker image creation
- Docker image push to registry
- CI pipeline validation

Workflow File:

```bash
.github/workflows/ci-cd.yml
```

---

## Docker Image

Image is automatically built using GitHub Actions.

Example:

```bash
docker pull <dockerhub-username>/wisecow:latest
```

---

# Problem Statement 2

Two automation scripts were implemented.

## 1. Application Health Checker

File:

```bash
scripts/app_health.sh
```

Features:

- Checks application availability
- Validates HTTP status code
- Reports UP or DOWN status

Usage:

```bash
bash scripts/app_health.sh
```

---

## 2. System Health Monitoring Script

File:

```bash
scripts/system_health.sh
```

Features:

- CPU Usage Monitoring
- Memory Usage Monitoring
- Disk Usage Monitoring
- Running Process Monitoring
- Alert Generation

Usage:

```bash
bash scripts/system_health.sh
```

---

# Dockerfile Explanation

The Dockerfile:

- Uses Ubuntu Base Image
- Installs:
  - bash
  - fortune
  - cowsay
  - netcat
- Copies application files
- Exposes port 4499
- Starts Wisecow application

---

# Minikube Environment

Cluster Type:

```bash
Minikube
```

Kubernetes Version:

```bash
v1.35.x
```

Container Runtime:

```bash
Docker
```

---

# Validation Commands

### Docker

```bash
docker ps
docker logs wisecow-container
```

### Kubernetes

```bash
kubectl get pods
kubectl get svc
kubectl get deployments
```

### Minikube

```bash
minikube status
```

---

# Technologies Used

- Docker
- Kubernetes
- Minikube
- GitHub Actions
- Bash
- Linux
- GitHub

---

# Challenge Goals

## TLS Communication

TLS support can be enabled through Kubernetes Ingress and TLS secrets.

## Continuous Deployment

Deployment automation can be extended using GitHub Actions and Kubernetes manifests.

---

# Author

**Harsh Mahala**

GitHub:

https://github.com/harshmahala

Repository:

https://github.com/harshmahala/wisecow

---

# Assignment Status

| Task | Status |
|--------|--------|
| Dockerization | ✅ Completed |
| Kubernetes Deployment | ✅ Completed |
| Service Exposure | ✅ Completed |
| GitHub Actions CI | ✅ Completed |
| Application Health Checker | ✅ Completed |
| System Health Monitoring | ✅ Completed |
| Public GitHub Repository | ✅ Completed |
| TLS (Challenge Goal) | ⚠ Optional |
| KubeArmor Policy (Optional) | ⚠ Optional |

---