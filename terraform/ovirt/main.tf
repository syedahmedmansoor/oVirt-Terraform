provider "ovirt" {
  url = "${var.ovirt_url}"
  username  = "${var.ovirt_username}"
  password  = "${var.ovirt_password}"
  cafile    = "/root/terraform/ovirt-manager.crt"
}

terraform {
  backend "local" {
    path = "ovirt_terraform.tfstate"
  }
}

# Create VM call temp01
module "temp01" {
  source            = "../modules/vms"
  cluster_id        = "8df74068-d2df-11eb-8494-00163e4b6332"
  vm_name           = "temp01"
  vm_hostname       = "temp01.example.com"
  vm_dns_servers    = "8.8.8.8"
  vm_dns_search     = "example.com"
  vm_memory         = "4096"
  vm_cpu_cores      = "2"
  vm_timezone       = "Asia/Karachi"
  vm_template_id    = "55d08497-a7ed-4b95-9e82-47033269f3a4"
  vm_nic_device     = "eth0"
  vm_nic_ip_address = "10.82.3.68"
  vm_nic_gateway    = "10.82.1.250"
  vm_nic_netmask    = "255.255.0.0"
}
