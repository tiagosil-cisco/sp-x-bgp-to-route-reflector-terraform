resource "iosxr_router_bgp" "router_bgp_rrclient" {
  depends_on                            = [iosxr_router_bgp_address_family.rr_client_ipv4-unicast, iosxr_router_bgp_address_family.rr_client_ipv6-unicast, iosxr_router_bgp_address_family.rr_client_vpnv4-unicast, iosxr_router_bgp_address_family.rr_client_vpnv6-unicast, iosxr_router_bgp_address_family.rr_client_l2vpn-evpn, iosxr_router_bgp_neighbor_group.neighbor_group_rr_client]
  for_each                              = local.rr_clients
  device                                = each.key
  as_number                             = local.as_number
  bgp_router_id                         = each.value.bgp_router_id
  ibgp_policy_out_enforce_modifications = each.value.ibgp_policy_out_enforce_modifications
  neighbors = [
    for neighbor_name, neighbor_config in local.route_reflectors :
    {
      neighbor_address   = neighbor_config.bgp_router_id
      remote_as          = local.as_number
      use_neighbor_group = iosxr_router_bgp_neighbor_group.neighbor_group_rr_client[each.key].name
    }
  ]
}


resource "iosxr_router_bgp" "router_bgp_rrpce" {
  depends_on    = [iosxr_router_bgp_address_family.rr_ipv4-unicast, iosxr_router_bgp_address_family.rr_ipv6-unicast, iosxr_router_bgp_address_family.rr_vpnv4-unicast, iosxr_router_bgp_address_family.rr_vpnv6-unicast, iosxr_router_bgp_address_family.rr_l2vpn-evpn, iosxr_router_bgp_neighbor_group.neighbor_group_rr_client]
  for_each      = local.route_reflectors
  device        = each.key
  as_number     = local.as_number
  bgp_router_id = each.value.bgp_router_id
  neighbors = [
    for neighbor_name, neighbor_config in local.rr_clients :
    {
      neighbor_address   = neighbor_config.bgp_router_id
      remote_as          = local.as_number
      use_neighbor_group = iosxr_router_bgp_neighbor_group.neighbor_group_rrpce[each.key].name

    }
  ]
}