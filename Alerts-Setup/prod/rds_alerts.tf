# Aurora Serverless Capacity Maxed
resource "aws_cloudwatch_metric_alarm" "rds_capacity_maxed" {
  alarm_name = "${var.project_name}-${var.environment}-rds-${var.rds_cluster_identifier}-capacity-maxed"

  namespace           = "AWS/RDS"
  metric_name         = "ServerlessDatabaseCapacity"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 2
  threshold           = var.rds_max_acu
  comparison_operator = "GreaterThanOrEqualToThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    DBClusterIdentifier = var.rds_cluster_identifier
  }

  alarm_description = "Aurora Serverless capacity reached maximum ACU"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}

# High Database Connections (80% - warning)
resource "aws_cloudwatch_metric_alarm" "rds_high_connections" {
  alarm_name = "${var.project_name}-${var.environment}-rds-${var.rds_cluster_identifier}-high-connections"

  namespace           = "AWS/RDS"
  metric_name         = "DatabaseConnections"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 2
  threshold           = var.rds_max_connections * 0.8 # confirm var.rds_max_connections = 6000, not the formula-derived value
  comparison_operator = "GreaterThanThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    DBClusterIdentifier = var.rds_cluster_identifier
  }

  alarm_description = "High DB connections (over 80%)"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}

# Low Freeable Memory
resource "aws_cloudwatch_metric_alarm" "rds_low_memory" {
  alarm_name = "${var.project_name}-${var.environment}-rds-${var.rds_cluster_identifier}-low-memory"

  namespace           = "AWS/RDS"
  metric_name         = "FreeableMemory"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 2
  threshold           = var.rds_low_memory_threshold
  comparison_operator = "LessThanThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    DBClusterIdentifier = var.rds_cluster_identifier
  }

  alarm_description = "Aurora low freeable memory"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}

# Deadlocks Detected
resource "aws_cloudwatch_metric_alarm" "rds_deadlocks" {
  alarm_name = "${var.project_name}-${var.environment}-rds-${var.rds_cluster_identifier}-deadlocks"

  namespace           = "AWS/RDS"
  metric_name         = "Deadlocks"
  statistic           = "Sum"
  period              = 300
  evaluation_periods  = 1
  threshold           = 0
  comparison_operator = "GreaterThanThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    DBClusterIdentifier = var.rds_cluster_identifier
  }

  alarm_description = "Deadlocks detected in Aurora PostgreSQL"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}
