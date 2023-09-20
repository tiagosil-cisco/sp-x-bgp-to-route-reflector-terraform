resource "iosxr_router_bgp_neighbor_group" "neighbor_group_rr_client" {
  for_each                       = local.rr_clients
  device                         = each.key
  as_number                      = each.value.as_number
  advertisement_interval_seconds = 10
  name                           = "BGP_RR"
  remote_as                      = local.as_number
  update_source                  = "Loopback0"
  address_families = [
    {
      af_name                             = "ipv4-labeled-unicast"
      soft_reconfiguration_inbound_always = true
    },
    {
      af_name                             = "vpnv4-unicast"
      soft_reconfiguration_inbound_always = true
    },
    {
      af_name                             = "vpnv6-unicast"
      soft_reconfiguration_inbound_always = true
    },
    {
      af_name                             = "l2vpn-evpn"
      soft_reconfiguration_inbound_always = true
    }
  ]
}

resource "iosxr_router_bgp_neighbor_group" "neighbor_group_rrpce" {
  for_each                       = local.route_reflectors
  device                         = each.key
  as_number                      = each.value.as_number
  advertisement_interval_seconds = 10
  name                           = "BGP_RR_CLIENTS"
  remote_as                      = local.as_number
  update_source                  = "Loopback0"
  address_families = [
    {
      af_name                             = "ipv4-labeled-unicast"
      soft_reconfiguration_inbound_always = true
      route_reflector_client              = true
    },
    {
      af_name                             = "vpnv4-unicast"
      soft_reconfiguration_inbound_always = true
      route_reflector_client              = true
    },
    {
      af_name                             = "vpnv6-unicast"
      soft_reconfiguration_inbound_always = true
      route_reflector_client              = true
    },
    {
      af_name                             = "l2vpn-evpn"
      soft_reconfiguration_inbound_always = true
      route_reflector_client              = true
    }
  ]
}