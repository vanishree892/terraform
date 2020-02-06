provider "vsphere" {
  user                 = "administrator@vpshere.local"
  password             = "Wipro@123"
  vsphere_server       = "172.16.8.16"
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "myvm" {
  name = "vm-deleteme"

  datacenter = "opendc-dc1"
  cluster    = "SDXT7_CommonWorkload"

  vcpu   = "1"
  memory = "4096"

  dns_servers = ["8.8.8.8"]

  network_interface {
     network_id = ""
  }

  disk {
   size             = 16
   name             = "vanisid.vmdk"
   eagerly_scrub    = false
   thin_provisioned = true
   
  }
}
