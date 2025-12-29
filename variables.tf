####### profile to authenticate to aws #######

variable "aws_auth_profile" {
  type        = string
  description = "AWS profile to use for authentication"
  default     = "admin-cli"
}

variable "aws_auth_region" {
  type        = string
  description = "AWS region to use for authentication"
  default     = "ap-southeast-1"
}


####### Postgres Secret Variables #######

variable "postgres_secret" {
  description = "Credentials for Postgres Database"
  type        = map(string)
  sensitive   = true
}

variable "postgres_secret_name" {
  description = "Name of the Postgres Secret"
  type        = string
  default     = "postgres-credentials"
}

variable "postgres_recovery_window_in_days" {
  description = "Recovery window in days for Postgres Secret deletion"
  type        = number
  default     = 0
}

####### Mongo Secret Variable #######
variable "mongo_secret" {
  description = "Credentials for MongoDB"
  type        = map(string)
  sensitive   = true
}

variable "mongo_secret_name" {
  description = "Name of the MongoDB Secret"
  type        = string
  default     = "mongo-credentials"
}

variable "mongo_recovery_window_in_days" {
  description = "Recovery window in days for MongoDB Secret deletion"
  type        = number
  default     = 0
}

####### Redis Secret Variable #######

variable "redis_secret" {
  description = "Credentials for Redis"
  type        = map(string)
  sensitive   = true
}

variable "redis_secret_name" {
  description = "Name of the Redis Secret"
  type        = string
  default     = "redis-credentials"
}

variable "redis_recovery_window_in_days" {
  description = "Recovery window in days for Redis Secret deletion"
  type        = number
  default     = 0
}