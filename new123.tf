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
    label = "VM Network"
  }

  disk {
    template  = "template-20171005.1-UbuntuTrusty-DS-10-SAS-1"
    datastore = "Local_datastore2_65.79"
    type      = "thin"
  }
}
