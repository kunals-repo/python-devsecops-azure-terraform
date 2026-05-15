🚀 Project Overview

This project demonstrates an advanced Cloud DevOps CI/CD pipeline for deploying a Python application on an Azure Linux Virtual Machine 
using GitHub Actions automation.

The pipeline automates the complete software delivery lifecycle including:

⚙️ Continuous Integration (CI)

🔐 Security Scanning (DevSecOps)

☁️ Infrastructure Provisioning using Terraform (IaC)

📦 Artifact Build & Management

🚀 Continuous Deployment (CD)



🔄 CI/CD Workflow


Pipeline workflow dispatch

        ↓
        
GitHub Actions Triggered

        ↓
Self-hosred runner starts    

        ↓  
        
Checkout Repository

        ↓
        
Install Python Dependencies

        ↓
        
Python code quality  & Unit tests

        ↓
        
Generate Build Artifacts

        ↓
        
Run Trivy Security Scan

        ↓
        
Generate SARIF Report

        ↓
        
Upload Security Report to GitHub Security tab

        ↓
        
Terraform Infrastructure Provisioning

        ↓
        
Create Azure Linux VM

        ↓
        
Deploy Application via SSH

        ↓
        
Creation & restart Flask Application Service

        ↓
        
Application Live on Azure VM


🎯 Learning Outcomes

This project helped in understanding and implementing:

✅ Real-world CI/CD workflows

✅ Hosting self-hosted runner

✅ DevSecOps security practices

✅ Infrastructure as Code (IaC)

✅ GitHub Actions workflow automation

✅ Azure cloud infrastructure provisioning

✅ Linux server management

✅ Trivy security scanning integration

✅ SARIF security reporting

✅ Artifact build & management

✅ Multi-job workflow orchestration

✅ Automated SSH-based deployments

✅ Production-style DevOps pipelines

