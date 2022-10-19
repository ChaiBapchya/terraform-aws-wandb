variable "region" {
  type        = string
  description = "Region to deploy resources"
  default     = "us-west-1"
}

variable "namespace" {
  type        = string
  description = "Name prefix used for resources"
}

variable "domain_name" {
  type        = string
  description = "Domain name used to access instance."
}

variable "zone_id" {
  type        = string
  description = "Id of Route53 zone"
}

variable "subdomain" {
  type        = string
  default     = null
  description = "Subdomain for accessing the Weights & Biases UI."
}

variable "wandb_license" {
  type = string
}

variable "database_engine_version" {
  description = "Version for MySQL Auora"
  type        = string
  default     = "8.0.mysql_aurora.3.01.0"

  validation {
    condition     = contains(["5.7", "8.0.mysql_aurora.3.01.0", "8.0.mysql_aurora.3.02.0"], var.database_engine_version)
    error_message = "We only support MySQL: \"5.7\"; \"8.0.mysql_aurora.3.01.0\"; \"8.0.mysql_aurora.3.02.0\"."
  }
}

variable "database_instance_class" {
  description = "Instance type to use by database master instance."
  type        = string
  default     = "db.r5.large"
}

variable "database_snapshot_identifier" {
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
  type        = string
  default     = null
}

variable "database_sort_buffer_size" {
  description = "Specifies the sort_buffer_size value to set for the database"
  type        = number
  default     = 262144
}

variable "wandb_version" {
  description = "The version of Weights & Biases local to deploy."
  type        = string
  default     = "latest"
}

variable "wandb_image" {
  description = "Docker repository of to pull the wandb image from."
  type        = string
  default     = "wandb/local"
}

variable "bucket_name" {
  type    = string
  default = ""
}

variable "bucket_kms_key_arn" {
  type        = string
  description = "The Amazon Resource Name of the KMS key with which S3 storage bucket objects will be encrypted."
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC."
  # default     = "vpc-0a62f7fds47" # Replace this with your VPC ID
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR ranges to create in VPC."
  default     = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR ranges to create in VPC."
  default     = ["10.10.10.0/24", "10.10.11.0/24"]
}

variable "database_subnets" {
  type        = list(string)
  description = "List of database subnet CIDR ranges to create in VPC."
  default     = ["10.10.20.0/24", "10.10.21.0/24"]
}

# Optional
variable "elasticache_subnets" {
  type        = list(string)
  description = "List of elasticache subnet CIDR ranges to create in VPC."
  default     = ["10.10.30.0/24", "10.10.31.0/24"]
}