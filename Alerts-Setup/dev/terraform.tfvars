aws_region = "us-west-2"

project_name = "serendipity"
environment  = "dev"

alert_email = "msp-support+serendipity@meyicloud.com"

ec2_instance_ids = [
  "i-0968f02cec9c50d63",
  "i-046473da968131cb0"
]

rds_cluster_identifier   = "serendipity-dev-cluster"
rds_max_acu              = 64
rds_max_connections      = 6000
rds_low_memory_threshold = 2147483648 # 2 GB

ecs_services = {
  service1 = {
    cluster_name  = "serendipity-dev-be-service-cluster"
    service_name  = "serendipity-dev-be-service-service"
    desired_count = 1
  }

  service2 = {
    cluster_name  = "serendipity-dev-tracking-history-cluster"
    service_name  = "serendipity-dev-tracking-history-service"
    desired_count = 1
  }

  service3 = {
    cluster_name  = "serendipity-dev-mqtt-service-cluster"
    service_name  = "serendipity-dev-mqtt-service-service"
    desired_count = 1
  }

  service4 = {
    cluster_name  = "serendipity-dev-mosquitto-cluster"
    service_name  = "serendipity-dev-mosquitto-service"
    desired_count = 1
  }

  service5 = {
    cluster_name  = "serendipity-dev-chat-service-cluster"
    service_name  = "serendipity-dev-chat-service-service"
    desired_count = 1
  }

  service6 = {
    cluster_name  = "serendipity-dev-graph-service-cluster"
    service_name  = "serendipity-dev-graph-service-service`"
    desired_count = 1
  }
}

opensearch_domain_name        = "serendipity-dev-sdapp"
opensearch_low_disk_threshold = 10240 # 10 GB

neo4j_uri      = "bolt://10.100.1.165:7687"
neo4j_username = "neo4j"
neo4j_password = "neo4j"
neo4j_port     = 7687

lambda_subnet_ids = [
  "subnet-05ae79b473b5f1347",
  "subnet-0c78def448e429f26"
]

vpc_id = "vpc-0511db6bca3952574"
