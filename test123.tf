## Configure the vSphere Provider
provider "vsphere" {
    vsphere_server = "172.16.8.16"
    user = "administrator@vpshere.local"
    password = "Wipro@123"
    allow_unverified_ssl = true
}

## Build VM
data "vsphere_datacenter" "dc" {
  name = "opendc-dc1"
}

data "vsphere_datastore" "datastore" {
  name          = "Local_datastore2_65.79"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {}

data "vsphere_network" "mgmt_lan" {
  name          = "VM Network2"
 
}

resource "vsphere_virtual_machine" "vanisid" {
  name             = "vanisid"
  resource_pool_id = "566"
  datastore_id     = "1701"


  num_cpus   = 1
  memory     = 2048
  wait_for_guest_net_timeout = 0
  guest_id = "centos7_64Guest"
  nested_hv_enabled =true


  disk {
   size             = 16
   name             = "vanisid.vmdk"
   eagerly_scrub    = false
   thin_provisioned = true
  }
}
