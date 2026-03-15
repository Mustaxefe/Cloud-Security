# Cloud Security Lab – Insecure vs Secure AWS Architecture

## Objetivo
Este projeto demonstra como identificar e corrigir configurações inseguras em ambientes AWS usando Terraform.
A ideia é simular erros comuns de segurança em cloud e depois aplicar boas práticas para mitigar esses riscos.

O projeto foi criado como laboratório prático de **Cloud Security**, abordando controles de segurança em:

- EC2
- IAM
- S3
- Security Groups
- Criptografia de armazenamento

---

## Arquitetura do projeto

cloud-security-lab
│
├─ insecure/
│   Infraestrutura propositalmente insegura
│
├─ secure/
│   Infraestrutura corrigida seguindo boas práticas de segurança
│
├─ docs/
│   Evidências e documentação técnica
│
└─ README.md

---

## Problemas de segurança simulados

Na arquitetura insegura foram simulados problemas comuns encontrados em ambientes cloud:

- Security Group com SSH aberto para internet (0.0.0.0/0)
- Bucket S3 potencialmente exposto publicamente
- IAM Role com permissões excessivas
- Armazenamento sem garantia de criptografia

---

## Controles aplicados na versão segura

| Área    | Controle aplicado |
|---------|---------------------------------------|
| Network | SSH restrito ao IP autorizado         |
| IAM     | Role com princípio de least privilege |
| Storage | Criptografia em volume EBS            |
| Storage | Criptografia em bucket S3             |
| Storage | Versionamento habilitado              |
| Storage | Block Public Access no S3             |
| Compute | EC2 com IAM Role dedicada             |

---

## Tecnologias utilizadas

- AWS
- Terraform
- EC2
- S3
- IAM
- VPC
- Security Groups

---

## Aprendizados

Este projeto demonstra conceitos importantes de segurança em cloud:

- Redução da superfície de ataque
- Princípio do menor privilégio
- Proteção de dados em repouso
- Hardening de infraestrutura
- Boas práticas de infraestrutura como código (IaC)