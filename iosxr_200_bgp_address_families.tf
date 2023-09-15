resource "iosxr_router_bgp_address_family" "rr_client_ipv4-unicast" {
  for_each  = var.rr_clients
  device    = each.key
  as_number = local.as_number
  af_name   = "ipv4-unicast"

  networks = [
    {
      address    = each.value.bgp_router_id
      masklength = 32
    }
  ]
}

resource "iosxr_router_bgp_address_family" "rr_client_ipv6-unicast" {
  for_each  = var.rr_clients
  device    = each.key
  as_number = local.as_number
  af_name   = "ipv6-unicast"

}

resource "iosxr_router_bgp_address_family" "rr_client_vpnv4-unicast" {
  for_each  = var.rr_clients
  device    = each.key
  as_number = local.as_number
  af_name   = "vpnv4-unicast"

}

resource "iosxr_router_bgp_address_family" "rr_client_vpnv6-unicast" {
  for_each  = var.rr_clients
  device    = each.key
  as_number = local.as_number
  af_name   = "vpnv6-unicast"

}

resource "iosxr_router_bgp_address_family" "rr_client_l2vpn-evpn" {
  for_each  = var.rr_clients
  device    = each.key
  as_number = local.as_number
  af_name   = "l2vpn-evpn"

}



resource "iosxr_router_bgp_address_family" "ipv4-unicast" {
  for_each  = var.route_reflectors
  device    = each.key
  as_number = local.as_number
  af_name   = "ipv4-unicast"

  networks = [
    {
      address    = each.value.bgp_router_id
      masklength = 32
    }
  ]
}

resource "iosxr_router_bgp_address_family" "ipv6-unicast" {
  for_each  = var.route_reflectors
  device    = each.key
  as_number = local.as_number
  af_name   = "ipv6-unicast"

}

resource "iosxr_router_bgp_address_family" "vpnv4-unicast" {
  for_each  = var.route_reflectors
  device    = each.key
  as_number = local.as_number
  af_name   = "vpnv4-unicast"

}

resource "iosxr_router_bgp_address_family" "vpnv6-unicast" {
  for_each  = var.route_reflectors
  device    = each.key
  as_number = local.as_number
  af_name   = "vpnv6-unicast"

}

resource "iosxr_router_bgp_address_family" "l2vpn-evpn" {
  for_each  = var.route_reflectors
  device    = each.key
  as_number = local.as_number
  af_name   = "l2vpn-evpn"

}

