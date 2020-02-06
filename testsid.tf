# The Provider block sets up the vSphere provider - How to connect to vCenter. Note the use of
# variables to avoid hardcoding credentials here

provider "vsphere" {
    vsphere_server = "172.16.8.16"
    user = "administrator@vpshere.local"
    password = "Wipro@123"
    allow_unverified_ssl = true
}

# The Data sections are about determining where the virtual machine will be placed. 
# Here we are naming the vSphere DC, the cluster, datastore, virtual network and the template
# name. These are called upon later when provisioning the VM resource

data "vsphere_datacenter" "dc" {
  name = "opendc-dc1"
}

data "vsphere_datastore" "datastore" {
  name          = "Local_datastore2_65.79"
  datacenter_id = "1701"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "SDXT7_CommonWorkload"
  datacenter_id = "1701"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "1701"
}

data "vsphere_virtual_machine" "template" {
  name          = "vanisid"
  datacenter_id = "1701"
}

# The Resource section creates the virtual machine, in this case 
# from a template

resource "vsphere_virtual_machine" "vm" {
  name             = vanisid
  resource_pool_id = "566"
  datastore_id     = "1701"

  num_cpus = 2
  memory   = 8192
 

  disk {
    label            = "vanisid.vmdk"
    size             = 16
    eagerly_scrub    = false
    thin_provisioned = true
  }
