# 1. Queremos saber o nome do projeto que foi usado
output "projeto_ativo" {
  description = "Nome do projeto definido nas variáveis"
  value       = var.project_name
}

# 2. Queremos saber quem é o dono (owner)
output "responsavel" {
  description = "O analista responsável por este lab"
  value       = var.owner
}