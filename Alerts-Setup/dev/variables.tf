variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "alert_email" {
  description = "Email address to receive alerts"
  type        = string
}

variable "ec2_instance_ids" {
  description = "List of EC2 instance IDs to monitor"
  type        = list(string)
}

variable "rds_cluster_identifier" {
  description = "Aurora RDS cluster identifier"
  type        = string
}

variable "rds_max_acu" {
  description = "Maximum Aurora Serverless ACU"
  type        = number
}

variable "rds_max_connections" {
  description = "Maximum allowed DB connections"
  type        = number
}

variable "rds_low_memory_threshold" {
  description = "Low freeable memory threshold (bytes)"
  type        = number
}

variable "ecs_services" {
  description = "Map of ECS services across clusters"
  type = map(object({
    cluster_name  = string
    service_name  = string
    desired_count = number
  }))
}

variable "ecs_cpu_threshold" {
  description = "CPU utilization threshold for ECS services"
  type        = number
  default     = 80
}

variable "ecs_memory_threshold" {
  description = "Memory utilization threshold for ECS services"
  type        = number
  default     = 80
}

variable "opensearch_domain_name" {
  description = "OpenSearch domain name"
  type        = string
}


variable "opensearch_low_disk_threshold" {
  description = "Low disk threshold in bytes"
  type        = number
}

variable "neo4j_uri" {
  description = "Neo4j connection URI"
  type        = string
}

variable "neo4j_username" {
  description = "Neo4j username"
  type        = string
}

variable "neo4j_port" {
  description = "Neo4j port"
  type        = number
}

variable "neo4j_password" {
  description = "Neo4j password"
  type        = string
  sensitive   = true
}

variable "lambda_subnet_ids" {
  description = "Private subnet IDs for Lambda"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where Lambda runs"
  type        = string
}
