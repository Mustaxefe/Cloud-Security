# Riscos e Mitigações

## 1. SSH aberto para internet

Cenário inseguro:

Security Group permitindo acesso SSH de qualquer origem:

0.0.0.0/0

Risco:

- Ataques de brute force
- Acesso não autorizado

Mitigação aplicada:

Restrição do acesso SSH para um único IP autorizado.

---------------------------------------------------------

## 2. Exposição de bucket S3

Cenário inseguro:

Bucket potencialmente acessível publicamente.

Risco:

- Vazamento de dados
- Download público não autorizado

Mitigação aplicada:

- Block Public Access habilitado
- Criptografia habilitada
- Versionamento habilitado

---------------------------------------------------------

## 3. IAM com privilégios excessivos

Cenário inseguro:

Uso de permissões administrativas amplas.

Risco:

- Escalada de privilégios
- Comprometimento total do ambiente

Mitigação aplicada:

Criação de role com permissões mínimas necessárias:

- s3:GetObject
- s3:ListBucket

Aplicando o princípio de least privilege.

---------------------------------------------------------

## 4. Armazenamento sem criptografia

Cenário inseguro:

Volume sem criptografia.

Risco:

- Exposição de dados caso o volume seja comprometido

Mitigação aplicada:

Criptografia habilitada no volume EBS usando KMS gerenciado pela AWS.