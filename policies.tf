# 1. Criamos a "Lista de Tarefas" (Policy)
resource "aws_iam_policy" "lambda_logging" {
  name        = "${var.project_name}-logging-policy"
  description = "Permite que o lambda crie logs no CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      },
    ]
  })
}

# 2. "Grampeamos" a Policy no Crachá (Role)
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}