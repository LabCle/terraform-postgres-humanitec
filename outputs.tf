output "db_endpoint" {
  description = "Endpoint do banco de dados PostgreSQL"
  value       = aws_db_instance.postgres.endpoint
}

output "db_username" {
  description = "Usuário do banco de dados PostgreSQL"
  value       = aws_db_instance.postgres.username
}

output "db_name" {
  description = "Nome do banco de dados PostgreSQL"
  value       = aws_db_instance.postgres.db_name
}
