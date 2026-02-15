#AZ1
variable "resource_group_name" {
  type        = string
  default     = "az3-rg"
  description = "Resource Group name"
}

#AZ1
variable "location" {
  type        = string
  default     = "westeurope"
  description = "Azure region"
}

#AZ2
variable "vnet_name" {
  type        = string
  default     = "az3-vnet"
  description = "Virtual Network name"
}
#AZ2
variable "vnet_address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Address space for the VNet"
}
#AZ2
variable "subnet_name" {
  type        = string
  default     = "az3-subnet"
  description = "Subnet name"
}
#AZ2
variable "subnet_prefix" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Subnet address prefix"
}
#AZ2
variable "nsg_name" {
  type        = string
  default     = "az3-nsg"
  description = "Network Security Group name"
}

variable "public_ip_name" {
  type    = string
  default = "az3-lb-pip"
}

variable "lb_name" {
  type    = string
  default = "az3-lb"
}

variable "backend_pool_name" {
  type    = string
  default = "az3-backend-pool"
}

variable "probe_name" {
  type    = string
  default = "az3-health-probe"
}

variable "lb_rule_name" {
  type    = string
  default = "az3-lb-rule-http"
}

variable "vmss_name" { type = string }
variable "vm_size" { type = string }
variable "instance_count" { type = number }

variable "admin_username" { type = string }
variable "admin_password" { type = string }
