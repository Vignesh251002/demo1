data "aws_caller_identity" "current" {}

# OpenSearch Cluster RED
resource "aws_cloudwatch_metric_alarm" "opensearch_cluster_red" {
  alarm_name = "${var.project_name}-${var.environment}-opensearch-${var.opensearch_domain_name}-cluster-red"

  namespace           = "AWS/ES"
  metric_name         = "ClusterStatus.red"
  statistic           = "Maximum"
  period              = 60
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"

  dimensions = {
    DomainName = var.opensearch_domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }

  alarm_description = "OpenSearch cluster status is RED"
  alarm_actions     = [aws_sns_topic.alerts.arn]
}


# OpenSearch Cluster YELLOW
resource "aws_cloudwatch_metric_alarm" "opensearch_cluster_yellow" {
  alarm_name = "${var.project_name}-${var.environment}-opensearch-${var.opensearch_domain_name}-cluster-yellow"

  namespace           = "AWS/ES"
  metric_name         = "ClusterStatus.yellow"
  statistic           = "Maximum"
  period              = 300
  evaluation_periods  = 2
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"

  dimensions = {
    DomainName = var.opensearch_domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }

  alarm_description = "OpenSearch cluster status is YELLOW"
  alarm_actions     = [aws_sns_topic.alerts.arn]
}


# JVM Memory Pressure High
resource "aws_cloudwatch_metric_alarm" "opensearch_jvm_pressure" {
  alarm_name = "${var.project_name}-${var.environment}-opensearch-${var.opensearch_domain_name}-jvm-high"

  namespace           = "AWS/ES"
  metric_name         = "JVMMemoryPressure"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 2
  threshold           = 75
  comparison_operator = "GreaterThanThreshold"

  dimensions = {
    DomainName = var.opensearch_domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }

  alarm_description = "High JVM memory pressure in OpenSearch"
  alarm_actions     = [aws_sns_topic.alerts.arn]
}


# Low Free Storage Space
resource "aws_cloudwatch_metric_alarm" "opensearch_low_disk" {
  alarm_name = "${var.project_name}-${var.environment}-opensearch-${var.opensearch_domain_name}-low-disk"

  namespace           = "AWS/ES"
  metric_name         = "FreeStorageSpace"
  statistic           = "Minimum"
  period              = 300
  evaluation_periods  = 2
  threshold           = var.opensearch_low_disk_threshold
  comparison_operator = "LessThanThreshold"

  dimensions = {
    DomainName = var.opensearch_domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }

  alarm_description = "Low disk space on OpenSearch nodes"
  alarm_actions     = [aws_sns_topic.alerts.arn]
}


# Index Writes Blocked
resource "aws_cloudwatch_metric_alarm" "opensearch_index_blocked" {
  alarm_name = "${var.project_name}-${var.environment}-opensearch-${var.opensearch_domain_name}-index-blocked"

  namespace           = "AWS/ES"
  metric_name         = "ClusterIndexWritesBlocked"
  statistic           = "Maximum"
  period              = 60
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"

  dimensions = {
    DomainName = var.opensearch_domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }

  alarm_description = "Index writes blocked in OpenSearch"
  alarm_actions     = [aws_sns_topic.alerts.arn]
}


# Master Node Not Reachable
resource "aws_cloudwatch_metric_alarm" "opensearch_master_not_reachable" {
  alarm_name = "${var.project_name}-${var.environment}-opensearch-${var.opensearch_domain_name}-master-not-reachable"

  namespace           = "AWS/ES"
  metric_name         = "MasterReachableFromNode"
  statistic           = "Minimum"
  period              = 60
  evaluation_periods  = 2
  threshold           = 1
  comparison_operator = "LessThanThreshold"

  dimensions = {
    DomainName = var.opensearch_domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }

  alarm_description = "OpenSearch master node is not reachable"
  alarm_actions     = [aws_sns_topic.alerts.arn]
}
