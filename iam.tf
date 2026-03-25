# Este bloco cria o "Crachá" (Role)
resource "aws_iam_role" "iam_for_lambda" {
  # Aqui usamos a sua variável para o nome ficar profissional!
  name = "${var.project_name}-lambda-role"

  # Isso aqui é a "Política de Confiança": diz que o Lambda pode usar esse crachá
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  # Tags ajudam a organizar quem criou o quê (usando sua variável owner)
  tags = {
    Name  = var.project_name
    Owner = var.owner
  }
}