output "fgt_login_info" {
  value = <<FGTLOGIN

  # fgt username: admin
  # fgt initial password: ${module.fgcp-ha.fgt1_id}
  # cluster login url: https://${module.fgcp-ha.cluster_eip_public_ip}
  
  # fgt1 login url: https://${module.fgcp-ha.fgt1_hamgmt_ip}
  # fgt2 login url: https://${module.fgcp-ha.fgt2_hamgmt_ip}
  
  # tgw_creation: ${var.tgw_creation}
  FGTLOGIN
}