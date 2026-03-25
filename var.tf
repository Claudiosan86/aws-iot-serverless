# 1. A região onde a mágica acontece
variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

# 2. O nome do nosso projeto (usaremos para nomear os recursos)
variable "project_name" {
  description = "Nome do projeto para o portfólio"
  type        = string
  default     = "lab-smartlockers"
}

# 3. O dono do projeto (útil para saber quem criou o quê no console)
variable "owner" {
  description = "Quem é o responsável"
  type        = string
  default     = "claudio-san-roman"
}