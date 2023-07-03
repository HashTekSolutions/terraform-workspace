variable "region" {
  description = "AWS Region"
  type = string
  default = "ap-south-1"
}

variable "instance_name" {
  type    = string
  default = "workspace"
}

variable "sg_name" {
  type    = string
  default = "security-group"
}

variable "bucket_name" {
  type = string
  default = "hashtek-workspace-2406"
}

variable "keypair" {
 type = string
 default = "webapplication" 
}

variable "secretmanager" {
  type = string
  default = "keyfiles"
  
}



