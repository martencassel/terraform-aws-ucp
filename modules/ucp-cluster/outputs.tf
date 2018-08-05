output "addresses" {
    value = ["${module.ucp-manager.manager_public_dns_addresses}"]
}