# Definimos a criação de uma tabela no serviço DynamoDB da AWS
resource "aws_dynamodb_table" "lockers_table" {

  # O nome que aparecerá no Console AWS. 
  # Usamos a variável de projeto para manter o padrão: lab-smartlockers-status
  name = "${var.project_name}-status"

  # MODO DE COBRANÇA: PAY_PER_REQUEST (On-Demand)
  # Diferente do "Provisioned", aqui você não paga por hora. 
  # Se ninguém ler ou escrever dados, o custo na sua fatura é ZERO.
  billing_mode = "PAY_PER_REQUEST"

  # A CHAVE PRIMÁRIA: LockerId
  # Todo item no Dynamo precisa de uma Identidade Única para ser encontrado rápido.
  hash_key = "LockerId"

  # TRAVA DE SEGURANÇA: 
  # Definindo como 'false', garantimos que o 'terraform destroy' apague a tabela 
  # sem que a AWS bloqueie a remoção por proteção de dados.
  deletion_protection_enabled = false

  # DEFINIÇÃO DO ATRIBUTO DA CHAVE:
  # No NoSQL, só precisamos declarar os campos que são usados como Chaves (Keys).
  attribute {
    name = "LockerId" # O nome do campo deve ser idêntico ao hash_key acima
    type = "S"        # "S" significa String (texto). Aceita IDs como 'LKR-01'.
  }

  # GOVERNANÇA E ORGANIZAÇÃO:
  # Carimbamos o recurso com seu nome e o nome do projeto.
  # Isso é fundamental para rastrear custos e donos de recursos na nuvem.
  tags = {
    Name  = "${var.project_name}-database"
    Owner = var.owner
  }
}