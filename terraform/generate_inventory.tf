# Groups instances by OS family, then passes each group to the template.
# The template just loops and prints — no filtering logic needed there.

locals {
  inventory = { for name, inst in aws_instance.my_instance : name => {
    private_ip = inst.private_ip
    user      = var.instances[name].user
    os_family = var.instances[name].os_family
  }}

  redhat_hosts = { for name, inst in local.inventory : name => inst if inst.os_family == "redhat" }
  amazon_hosts = { for name, inst in local.inventory : name => inst if inst.os_family == "amazon" }
  master_hosts = { for name, inst in local.inventory : name => inst if inst.os_family == "ubuntu" }
}
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    ssh_key_path = var.ssh_key_path
    redhat       = local.redhat_hosts
    amazon       = local.amazon_hosts
    ubuntu       = local.master_hosts
  })

  filename        = "${path.root}/../inventories/dev/hosts.ini"
  file_permission = "0644"
}