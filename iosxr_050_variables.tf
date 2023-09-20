locals {
  project_title       = "SP-B"
  project_description = "Topology created using Terraform to represent SP-X"
  routers             = jsondecode(file("${path.module}/sp-x-devices.json"))
  rr_clients          = jsondecode(file("${path.module}/sp-x-rr-clients-variable.json"))
  route_reflectors    = jsondecode(file("${path.module}/sp-x-route-reflectors-variable.json"))



  /*
  routers = [
    {
      name = "pe01"
      host = "10.0.1.51"
    },
    {
      name = "pe02"
      host = "10.0.1.52"
    },
    {
      name = "p01"
      host = "10.0.1.53"
    },
    {
      name = "p02"
      host = "10.0.1.54"
    },
    {
      name = "p03"
      host = "10.0.1.55"
    },
    {
      name = "p04"
      host = "10.0.1.56"
    },
    {
      name = "pe03"
      host = "10.0.1.57"
    },
    {
      name = "pe04"
      host = "10.0.1.58"
    },
    {
      name = "asbr01"
      host = "10.0.1.59"
    },
    {
      name = "asbr02"
      host = "10.0.1.60"
    },
    {
      name = "rrpce01"
      host = "10.0.1.61"
    },
    {
      name = "rrpce02"
      host = "10.0.1.62"
    },
  ]
*/
  xr_username = "admin"
  xr_password = "C!sco123"

  as_number = 65331
}

/*
variable "rr_clients" {
  type = map(any)
  default = {
    pe01 = {
      as_number                             = 65331
      af_name                               = ["ipv4-labeled-unicast", "vpnv4-unicast", "vpnv6-unicast", "l2vpn-evpn"]
      allocate_label_akk                    = true
      bgp_router_id                         = "10.31.1.1"
      ibgp_policy_out_enforce_modifications = true
    },
    pe02 = {
      as_number                             = 65331
      af_name                               = ["ipv4-labeled-unicast", "vpnv4-unicast", "vpnv6-unicast", "l2vpn-evpn"]
      allocate_label_akk                    = true
      bgp_router_id                         = "10.31.1.2"
      ibgp_policy_out_enforce_modifications = true
    },

    pe03 = {
      as_number                             = 65331
      af_name                               = ["ipv4-labeled-unicast", "vpnv4-unicast", "vpnv6-unicast", "l2vpn-evpn"]
      allocate_label_akk                    = true
      bgp_router_id                         = "10.31.1.7"
      ibgp_policy_out_enforce_modifications = true
    },
    pe04 = {
      as_number                             = 65331
      af_name                               = ["ipv4-labeled-unicast", "vpnv4-unicast", "vpnv6-unicast", "l2vpn-evpn"]
      allocate_label_akk                    = true
      bgp_router_id                         = "10.31.1.8"
      ibgp_policy_out_enforce_modifications = true
    },
    asbr01 = {
      as_number                             = 65331
      af_name                               = ["ipv4-labeled-unicast", "vpnv4-unicast", "vpnv6-unicast", "l2vpn-evpn"]
      allocate_label_akk                    = true
      bgp_router_id                         = "10.31.1.9"
      ibgp_policy_out_enforce_modifications = true
    },
    asbr02 = {
      as_number                             = 65331
      af_name                               = ["ipv4-labeled-unicast", "vpnv4-unicast", "vpnv6-unicast", "l2vpn-evpn"]
      allocate_label_akk                    = true
      bgp_router_id                         = "10.31.1.10"
      ibgp_policy_out_enforce_modifications = true
    },

  }
}

variable "route_reflectors" {
  type = map(any)
  default = {
    rrpce01 = {
      as_number                             = 65331
      af_name                               = ["ipv4-labeled-unicast", "vpnv4-unicast", "vpnv6-unicast", "l2vpn-evpn"]
      allocate_label_akk                    = true
      bgp_router_id                         = "10.31.1.11"
      ibgp_policy_out_enforce_modifications = true
    },
    rrpce02 = {
      as_number                             = 65331
      af_name                               = ["ipv4-labeled-unicast", "vpnv4-unicast", "vpnv6-unicast", "l2vpn-evpn"]
      allocate_label_akk                    = true
      bgp_router_id                         = "10.31.1.12"
      ibgp_policy_out_enforce_modifications = true
    },

  }
}
*/