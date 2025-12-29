# =========================================================
# 1. Postgres Secret 
# =========================================================
resource "aws_secretsmanager_secret" "postgres" {
  # Name structure: environment/app/service
  name = var.postgres_secret_name

  description = "Postgres credentials for Flextrack Platform"

  # Set to 0 for immediate deletion during testing (Dev). 
  # Set to 7-30 for Production to allow recovery.
  recovery_window_in_days = var.postgres_recovery_window_in_days

  tags = {
    Name = "postgres-secret"
  }
}

resource "aws_secretsmanager_secret_version" "postgres" {
  secret_id = aws_secretsmanager_secret.postgres.id

  # Converts the map variable to a JSON string required by Secrets Manager
  secret_string = jsonencode(var.postgres_secret)
}

# =========================================================
# 2. MongoDB Secret 
# =========================================================
resource "aws_secretsmanager_secret" "mongodb" {
  name = var.mongo_secret_name

  description             = "MongoDB credentials for Flextrack Platform"
  recovery_window_in_days = var.mongo_recovery_window_in_days

  tags = {
    Name = "mongo-secret"
  }
}

resource "aws_secretsmanager_secret_version" "mongodb" {
  secret_id     = aws_secretsmanager_secret.mongodb.id
  secret_string = jsonencode(var.mongo_secret)
}

# =========================================================
# 3. Redis Secret 
# =========================================================
resource "aws_secretsmanager_secret" "redis" {
  name = var.redis_secret_name

  description             = "Redis credentials for Flextrack Platform"
  recovery_window_in_days = var.redis_recovery_window_in_days

  tags = {
    Name = "redis-secret"
  }
}

resource "aws_secretsmanager_secret_version" "redis" {
  secret_id     = aws_secretsmanager_secret.redis.id
  secret_string = jsonencode(var.redis_secret)
}