variable "aws_region" {
  description = "Região onde o recurso será criado"
  default     = "us-east-1"
}

variable "db_name" {
  description = "Nome do banco de dados"
  default     = "example_db"
}

variable "db_username" {
  description = "Usuário do banco de dados"
  default     = "admin"
}

variable "db_instance_class" {
  description = "Classe da instância RDS"
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Armazenamento alocado para o banco (em GB)"
  default     = 20
}

variable "humanitec_app_id" {
  description = "ID do aplicativo no Humanitec"
  default     = "example-app"
}

variable "humanitec_env_id" {
  description = "ID do ambiente no Humanitec"
  default     = "development"
}

variable "aws_credentials" {
  type = object({
    access_key    = string
    secret_key    = string
    region        = string
    session_token = string
  })
}