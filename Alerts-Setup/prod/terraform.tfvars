aws_region = "us-west-2"

project_name = "serendipity"
environment  = "prod"

alert_email = "msp-support+serendipity@meyicloud.com"

ec2_instance_ids = [
  "i-0c8b18f51e213981e",
  "i-0d860a764450ccaef",
  "i-0376b05249b265b03"
]

rds_cluster_identifier   = "serendipity-prod-cluster"
rds_max_acu              = 256
rds_max_connections      = 6000
rds_low_memory_threshold = 2147483648 # 2 GB

ecs_services = {
  service1 = {
    cluster_name  = "serendipity-prod-be-service-cluster"
    service_name  = "serendipity-prod-be-service-service"
    desired_count = 1
  }

  service3 = {
    cluster_name  = "serendipity-prod-mqtt-service-cluster"
    service_name  = "serendipity-prod-mqtt-service-service"
    desired_count = 1
  }

  service5 = {
    cluster_name  = "serendipity-prod-chat-service-cluster"
    service_name  = "serendipity-prod-chat-service-service"
    desired_count = 1
  }

}

opensearch_domain_name        = "serendipity-prod-sdapp"
opensearch_low_disk_threshold = 10240 # 10 GB, in MB (FreeStorageSpace unit)

neo4j_uri      = "bolt://10.100.11.159:7687"
neo4j_username = "neo4j"
neo4j_password = "neo4j"
neo4j_port     = 7687

lambda_subnet_ids = [
  "subnet-07c2165db821257c7",
  "subnet-071afb886fda189fb"
]

vpc_id = "vpc-0840d75d2e5437264"
