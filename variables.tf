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

variable "instance_type" {
  type        = string
  description = "The type of EC2 instance"
  default = "t2.micro"
}

