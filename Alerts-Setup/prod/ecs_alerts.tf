# ECS Running Task Count < Desired
resource "aws_cloudwatch_metric_alarm" "ecs_running_tasks_low" {
  for_each = var.ecs_services

  alarm_name = "${var.project_name}-${var.environment}-ecs-${each.value.cluster_name}-${each.value.service_name}-tasks-low"

  namespace           = "ECS/ContainerInsights"
  metric_name         = "RunningTaskCount"
  statistic           = "Minimum"
  period              = 60
  evaluation_periods  = 2
  threshold           = each.value.desired_count
  comparison_operator = "LessThanThreshold"
  treat_missing_data  = "breaching" # no data likely means Container Insights is off or tasks are gone - treat as a problem, not "fine"

  dimensions = {
    ClusterName = each.value.cluster_name
    ServiceName = each.value.service_name
  }

  alarm_description = "ECS service running tasks below desired count"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}

# ECS High CPU Utilization
resource "aws_cloudwatch_metric_alarm" "ecs_high_cpu" {
  for_each = var.ecs_services

  alarm_name = "${var.project_name}-${var.environment}-ecs-${each.value.cluster_name}-${each.value.service_name}-high-cpu"

  namespace           = "AWS/ECS"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 2
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = each.value.cluster_name
    ServiceName = each.value.service_name
  }

  alarm_description = "High CPU utilization in ECS service"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}

# ECS High Memory Utilization
resource "aws_cloudwatch_metric_alarm" "ecs_high_memory" {
  for_each = var.ecs_services

  alarm_name = "${var.project_name}-${var.environment}-ecs-${each.value.cluster_name}-${each.value.service_name}-high-memory"

  namespace           = "AWS/ECS"
  metric_name         = "MemoryUtilization"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 2
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = each.value.cluster_name
    ServiceName = each.value.service_name
  }

  alarm_description = "High memory utilization in ECS service"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}
