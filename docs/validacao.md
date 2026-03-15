# Validação da Arquitetura Segura

Este documento descreve como a infraestrutura criada foi validada após o deploy com Terraform.

## 1. EC2 Instance

Verificações realizadas:

- Instância criada com sucesso
- Estado: Running
- Tipo da instância: t3.micro
- Security Group aplicado corretamente
- IAM Role associada à instância

------------------------------------------------

## 2. Security Group

Regras verificadas:

| Porta |       Origem      |  Descrição   |
|-------|-------------------|--------------|
|   22  | IP autorizado /32 | SSH restrito |

Validação:

- Não existe regra com 0.0.0.0/0
- Apenas o IP autorizado pode acessar via SSH

Risco mitigado:

- Brute force
- Exposição desnecessária da instância

---

## 3. IAM Role

Role associada à instância:

cloud-security-lab-limited-role

Validações:

- Role aplicada corretamente na EC2
- Policy customizada anexada
- Nenhuma policy administrativa

Trust Relationship:

EC2 é o único serviço autorizado a assumir a role.

------------------------------------------------

## 4. Volume EBS

|  Propriedade |  Valor  |
|--------------|---------|
| Tipo         |   gp3   |
| Tamanho      | 30 GB   |
| Criptografia | Ativada |
| KMS Key      | aws/ebs |

Benefício:

Proteção de dados em repouso.

------------------------------------------------


## 5. Bucket S3

Validações realizadas:

### Block Public Access

Block all public access = ON

Benefício:

Evita exposição pública acidental.

### Encryption

Server-side encryption habilitado.

Tipo:

SSE-S3

### Versioning

Bucket versioning habilitado.

Benefício:

- Proteção contra exclusão acidental
- Recuperação de versões anteriores