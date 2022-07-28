variable "root_id" {
  type    = string
  default = "dnl"
}

variable "root_name" {
  type    = string
  default = "Digital Nimbus Labs"
}

variable "deploy_management_resources" {
  type    = bool
  default = true
}

variable "log_retention_in_days" {
  type    = number
  default = 50
}

variable "security_alerts_email_address" {
  type    = string
  default = "contact@digitalnimbuslabs.com" # Replace this value with your own email address.
}

variable "management_resources_location" {
  type    = string
  default = "southcentralus"
}

variable "management_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_management_resources_custom"
  }
}


variable "name" {
    default = "foundation"
}


variable "tags" {
    default = {

    }
}
