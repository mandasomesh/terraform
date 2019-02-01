provider "aws" {
        access_key      = "XXXXXXXXXXXXXXXXXXXXXXXXXXX"
        secret_key      = "XXXXXXXXXXXXXXXXXXXXXXXX"
        region          = "us-east-1"
}

variable "cluster_name" {
        description     = "Enter the Cluster Identifier:"
}

variable "snapshot_name" {
        description     = "Enter the Snapshot name:"
}

resource "aws_redshift_cluster" "open-claims" {
  cluster_identifier            = "${var.cluster_name}"
  #database_name                = "mydb"
  #master_username              = "foo"
  #master_password              = "Mustbe8characters"
  node_type                     = "dc1.large"
  snapshot_identifier           = "${var.snapshot_name}"
  skip_final_snapshot           = "true"
  vpc_security_group_ids        = ["sg-09c627951d00a8b7b"]
  cluster_subnet_group_name     = "rssubnetgroup"
  availability_zone             = "us-east-1a"
}
