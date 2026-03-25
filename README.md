# 🔒 AWS IoT Smart Lockers - Infrastructure as Code

Projeto de infraestrutura serverless para gerenciamento de armários inteligentes (Smart Lockers), utilizando **Terraform** para provisionamento na **AWS**.

## 🚀 Arquitetura Atual
O projeto provisiona uma camada de persistência persistente e segura:
* **Amazon DynamoDB**: Tabela `lab-smartlockers-status` (On-Demand) para armazenar estados dos lockers.
* **AWS IAM**: Roles e Policies granulares para execução do Lambda (Logs e acesso ao DB).

## 🛠️ Stack Tecnológica
* **Terraform** (IaC)
* **AWS CLI** (Validação)
* **GitHub Actions** (Planejado para CI/CD)

## 📖 Como Executar (O "Checklist" N3)

### 1. Inicializar o Terraform
```bash
terraform init
