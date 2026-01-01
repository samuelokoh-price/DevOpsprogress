# End-to-End DevOps Pipeline Project

## Overview
This project demonstrates a complete **end-to-end DevOps automation pipeline** for a containerized Node.js web application. It covers continuous integration, automated deployment, infrastructure as code, configuration management, and system monitoring.

The goal of the project is to show how DevOps tools integrate across the full delivery lifecycle—from source code to a running, monitored application on AWS.

---

## Architecture & Workflow

**Development → Containerization → CI/CD → Cloud Deployment → Monitoring**

1. Develop and run a Node.js application locally on Ubuntu
2. Containerize the application using Docker
3. Automate build and deployment using Jenkins CI/CD
4. Provision AWS EC2 infrastructure using Terraform
5. Configure servers and services using Ansible
6. Orchestrate the full workflow with Bash scripting
7. Monitor system and application metrics using Prometheus and Grafana

---

## Key Features

- End-to-end CI/CD automation using Jenkins
- Infrastructure provisioning with Terraform (IaC)
- Configuration management with Ansible
- Containerized deployments using Docker
- Monitoring and observability with Prometheus and Grafana
- Fully automated setup and deployment workflow

---

## Issues Encountered & Resolutions

### Jenkins Pipeline Not Detected
**Issue:** Jenkins failed to detect the pipeline  
**Cause:** Incorrect file naming (`jenkinsfile` instead of `Jenkinsfile`)  
**Fix:** Renamed the file and validated execution through Jenkins logs  

### Missing Metrics in Grafana
**Issue:** Grafana dashboards displayed no metrics  
**Cause:** Prometheus was not configured as a data source  
**Fix:** Added Prometheus as a data source and verified metric ingestion  

### Cross-Tool Integration Challenges
**Issue:** Debugging failures across CI, infrastructure, and monitoring layers  
**Fix:** Systematic log inspection and configuration validation across tools  

---

## Technology Stack

### Application
- Node.js
- Express.js

### Containerization
- Docker

### CI/CD
- Jenkins

### Cloud
- AWS EC2

### Monitoring & Observability
- Prometheus
- Grafana
- Node Exporter
- cAdvisor

### Automation & IaC
- Terraform
- Ansible
- Bash scripting

---

## Automation Flow

1. **Terraform**
   - Provisions AWS EC2 instance and security groups

2. **Ansible**
   - Installs Docker
   - Configures application and monitoring stack

3. **Bash Script (`setup.sh`)**
   - Executes Terraform
   - Retrieves EC2 public IP/DNS
   - Runs Ansible against the instance
   - Verifies running containers using `docker ps`

---

## Accessing Services

- **Grafana:** `http://<EC2_IP>:3000`  
  - Default credentials: `admin / admin`
- **Prometheus Targets:** `http://<EC2_IP>:9090/targets`

### Grafana Dashboard Setup
- Import dashboard **Node Exporter Full**
- Dashboard ID: **1868**
- Provides CPU, memory, disk, and network metrics

---

## Outcome

- Fully automated deployment pipeline from source code to AWS
- Continuous integration and delivery using Jenkins
- Infrastructure managed entirely as code
- Real-time monitoring and observability with Prometheus and Grafana
- Hands-on experience debugging real-world DevOps integration issues

---
