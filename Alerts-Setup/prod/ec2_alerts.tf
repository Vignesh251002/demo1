# EC2 Status Check Failed
resource "aws_cloudwatch_metric_alarm" "ec2_status_check_failed" { 
  for_each = toset(var.ec2_instance_ids)

  alarm_name = "${var.project_name}-${var.environment}-ec2-${each.key}-status-check-failed"

  namespace           = "AWS/EC2"
  metric_name         = "StatusCheckFailed"
  statistic           = "Maximum"
  period              = 60
  evaluation_periods  = 2
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  treat_missing_data  = "breaching"

  dimensions = {
    InstanceId = each.key
  }

  alarm_description = "EC2 instance ${each.key} failed status checks"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}

# EC2 System Status Check Failed
resource "aws_cloudwatch_metric_alarm" "ec2_system_check_failed" {
  for_each = toset(var.ec2_instance_ids)

  alarm_name = "${var.project_name}-${var.environment}-ec2-${each.key}-system-check-failed"

  namespace           = "AWS/EC2"
  metric_name         = "StatusCheckFailed_System"
  statistic           = "Maximum"
  period              = 60
  evaluation_periods  = 2
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  treat_missing_data  = "breaching"

  dimensions = {
    InstanceId = each.key
  }

  alarm_description = "EC2 system-level failure for ${each.key}"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}

# EC2 High CPU Utilization
resource "aws_cloudwatch_metric_alarm" "ec2_high_cpu" {
  for_each = toset(var.ec2_instance_ids)

  alarm_name = "${var.project_name}-${var.environment}-ec2-${each.key}-high-cpu"

  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 2
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = each.key
  }

  alarm_description = "High CPU usage on EC2 instance ${each.key}"
  alarm_actions     = [aws_sns_topic.alerts.arn]
  ok_actions        = [aws_sns_topic.alerts.arn]
}
