#This terraform script successfully starts a new cluster.


provider "aws" {
        access_key      = "XXXXXXXXXXXXXXXXXXXXXXXXx"
        secret_key      = "RhNMP+ppk30V6SkaBNMVun1DEY77F06WIF60p+OL"
        region          = "us-east-1"
}

#uncommenting this is throwing an error, because the cluster is already deleted
#data "aws_redshift_cluster" "som_cluster" {
#  cluster_identifier   = "somesh-cluster"
#}

resource "aws_redshift_cluster" "open-claims" {
  cluster_identifier            = "som-cluster"
  database_name                 = "mydb"
  master_username               = "foo"
  master_password               = "Mustbe8characters"
  node_type                     = "dc1.large"
  cluster_type                  = "single-node"
  #snapshot_identifier          = "somesh-snap"
  #snapshot_identifier          = "${data.aws_redshift_cluster.som_cluster.id}"
  skip_final_snapshot           = "true"
  #FinalSnapshotIdentifier      = "testing"
}
