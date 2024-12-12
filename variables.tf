variable "region" {
  type    = string
  default = "us-east-1"
}

variable "web_server_ami" {
  type = string
  # Replace with your desired AMI ID
  default = "ami-038bba9a164eb3dc1"
}

variable "web_server_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "app_server_ami" {
  type = string
  # Replace with your desired AMI ID
  default = "ami-038bba9a164eb3dc1"
}

variable "app_server_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "db_identifier" {
  type    = string
  default = "freight-broker-db"
}

variable "db_engine" {
  type    = string
  default = "mysql"
}

variable "db_engine_version" {
  type    = string
  default = "8.0"
}

variable "db_instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}