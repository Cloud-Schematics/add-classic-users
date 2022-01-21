##############################################################################
# IBM Cloud Provider
##############################################################################

provider ibm {
  ibmcloud_api_key      = var.ibmcloud_api_key
  iaas_classic_username = var.iaas_classic_username
  iaas_classic_api_key  = var.iaas_classic_api_key 
  ibmcloud_timeout      = 60
}

##############################################################################


##############################################################################
# Create Classic Access
##############################################################################

locals {
  # Convert list of users into an object. This way, each key for `ibm_compute_user` will be the user's email address
  classic_users_object = {
    for user in var.classic_users:
    (user.email) => user
  }
}

resource ibm_compute_user classic_users {
  for_each     = local.classic_users_object
  address1     = each.value.address1
  address2     = each.value.address2
  city         = each.value.city
  state        = each.value.state
  timezone     = each.value.timezone
  company_name = each.value.company_name
  country      = each.value.country
  email        = each.value.email
  first_name   = each.value.first_name
  has_api_key  = each.value.has_api_key
  last_name    = each.value.last_name
  permissions  = each.value.permissions
}

##############################################################################