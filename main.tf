terraform {
required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
}
}
        required_version = ">=1.2.0"
}

provider "aws" {
region = "ap-south-1"
}

locals {
        instances = {"Dev":"ami-0d3f444bc76de0a79","Manus":"ami-0d3f444bc76de0a79","Luffy":"ami-04708942c263d8190","kuchbhi":"ami-03f4878755434977f"}
}

resource "aws_instance" "aws_ec2_test" {
        for_each = local.instances
        ami = each.value
        instance_type = "t2.micro"
        tags = {
        Name = each.key
}
}
