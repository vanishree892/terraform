provider "vsphere" {
  version              = "1.11.0"
  user                 = "administrator@vpshere.local"
  password             = "Wipro@123"
  vsphere_server       = "172.16.8.16:9443"
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "myvm" {
  name = "vm-deleteme"
resource_pool_id = 566

 num_cpus = 2
  memory   = 1024
 network_interface {
    network_id = "VM Network"
  }
 

  disk {
   size             = 16
   name             = "vanisid.vmdk"
   eagerly_scrub    = false
   thin_provisioned = true
   
  }
}
