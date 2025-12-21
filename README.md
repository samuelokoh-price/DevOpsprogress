# End-to-End-Devops-pipeline-project

**Project Overview**
This project demonstrates a full DevOps automation pipeline, built step‑by‑step and tested at each stage:

**Node.js application**: Started with a simple Node.js app, hosted locally on Ubuntu.

**Docker containerization**: Packaged the app into a Docker container for portability and consistency.

**Jenkins CI/CD:** Configured Jenkins to automate builds, tests, and deployments.

**AWS EC2 deployment:** Deployed the containerized app to an EC2 instance in AWS.

**Monitoring stack:** Integrated Prometheus and Grafana to collect metrics and visualize logs.

**Infrastructure automation:** Used Terraform to provision infrastructure, Ansible to configure servers, and a Bash script to orchestrate the entire pipeline end‑to‑end.

**Tech Stack**

**Application:** Node.js, Express.js

**Containerization:** Docker

**CI/CD:** Jenkins

**Cloud:** AWS EC2

**Monitoring:** Prometheus, Grafana, Node Exporter, cAdvisor

**Automation:** Terraform, Ansible, Bash scripting

**Workflow**
Develop locally → Run Node.js app on Ubuntu.

Containerize → Build Docker image and run locally.

Automate builds → Jenkins pipeline triggers Docker builds and pushes.

Deploy to cloud → Terraform provisions EC2, Ansible installs Docker, Bash script ties it all together.

Monitor & visualize → Prometheus scrapes metrics, Grafana dashboards display system health.

 **Outcome**
Fully automated deployment pipeline from source code to running containers in AWS.

Continuous integration and delivery with Jenkins.

Real‑time monitoring and dashboards with Prometheus + Grafana.

Infrastructure as Code using Terraform and Ansible.

## Challenges I ran into:
**Jenkins was not detecting my pipeline file.**
   After checking the logs, I discovered that the Jenkinsfile name was incorrect — I had used a lowercase j. Renaming it with a capital J fixed the issue.
**Grafana was running but not displaying any metrics.**
   I later realized that Prometheus had not been added as a data source, and the Prometheus server URL was missing.
**What I learned:**
Small misconfigurations can break an entire pipeline
Reading logs carefully is more effective than guessing
DevOps is less about tools and more about understanding how systems connect and communicate
This project helped me build confidence in debugging real-world DevOps issues and understanding the full lifecycle of deployment and monitoring.

## 🚀 How to Run (Conceptual)

This project provisions infrastructure and deploys a monitoring stack automatically.  
Because the EC2 instance is secured with a private key pair, the exact pipeline cannot be run without access to my AWS environment.  
However, the steps are:

1. **Terraform** provisions an EC2 instance and security group.
2. **Ansible** installs Docker and configures the monitoring stack.
3. **Bash script (`setup.sh`)** orchestrates the entire pipeline:
   - Runs Terraform
   - Captures the EC2 public IP/DNS
   - Runs Ansible against the instance
   - Verifies containers with `docker ps`
4. **Access services**:
   - Grafana: `http://<EC2_IP>:3000` (admin/admin)
   - Prometheus: `http://<EC2_IP>:9090/targets`
5. **view dashboard**
   - Import Dashboard: Import the pre-made "Node Exporter      Full"    
   - dashboard (ID 1868) to automatically get CPU, memory, disk, and network graphs


**Pls Note:** Running this project requires an AWS account and the associated key pair.  
For demonstration purposes, the code here in the repo shows the automation flow, but actual execution is restricted to my environment.

