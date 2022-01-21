##############################################################################
# Account Variables
# Copyright 2020 IBM
##############################################################################

# Comment this variable if running in schematics
variable ibmcloud_api_key {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
  type        = string
  sensitive   = true
}

variable iaas_classic_username {
  description = "Classic username key used to initialize the provider"
  type        = string
  sensitive   = true
}

variable iaas_classic_api_key {
  description = "Classic API key used to initialize the provider"
  type        = string
  sensitive   = true
}

# Comment out if not running in schematics
variable TF_VERSION {
 default     = "1.0"
 description = "The version of the Terraform engine that's used in the Schematics workspace."
}

variable region {
  description = "Region where VPC will be created"
  type        = string
  default     = "us-south"
}

##############################################################################


##############################################################################
# Assess Variables
##############################################################################

variable classic_users {
  description = "A list describing users"
  type        = list(
    object({
      company_name = string
      address1     = string
      address2     = optional(string)
      city         = string
      state        = string
      timezone     = string
      country      = string
      email        = string
      first_name   = string
      last_name    = string
      has_api_key  = optional(bool) #  When the value is true, a SoftLayer API key is created for the user. The key is returned in the api_key attribute. When the value is false, any existing SoftLayer API keys for the user are deleted. The default value is false.
      permissions  = list(string)
      tags         = optional(list(string))
    })
  )
  default   = [
    {
      company_name = "example company"
      address1     = "12345 Any Street"
      address2     = "Suite #99"
      city         = "Atlanta"
      state        = "GA"
      timezone     = "CEST"
      country      = "USA"
      first_name   = "John"
      last_name    = "Test"
      email        = "john@test.example"
      has_api_key  = true
      permissions = [
        "ACCESS_ALL_GUEST",
        "ACCESS_ALL_HARDWARE",
        "SERVER_ADD",
        "SERVER_CANCEL",
        "RESET_PORTAL_PASSWORD",
      ]
    }
  ]
}

##############################################################################