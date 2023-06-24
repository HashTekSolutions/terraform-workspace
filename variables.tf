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
  default = "sai-manu-workspace-2406"
}

variable "keypair" {
 type = string
 default = "webapplication" 
}

variable "secretmanager" {
  type = string
  default = "keyfiles"
  
}