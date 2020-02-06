provider "vsphere" {
   vsphere_server = "172.16.8.16"
    user = "administrator@vpshere.local"
    password = "Wipro@123"
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "opendc-dc1"
}

data "vsphere_datastore" "datastore" {
  name          = "Local_datastore2_65.79"
  datacenter_id = 1701
}

data "vsphere_resource_pool" "pool" {
  name          = "SDXT7_CommonWorkload"
  datacenter_id = 1701
}

data "vsphere_network" "network" {
  name          = "public"
  datacenter_id = 1701
}

resource "vsphere_virtual_machine" "vm" {
  name             = "vanisid"
  resource_pool_id = 566
  datastore_id     = 1701

  num_cpus = 2
  memory   = 1024
  guest_id = "other3xLinux64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 20
  }
}
