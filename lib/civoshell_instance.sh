#!/bin/sh
# civoshell_instance

civoshell_instance() {

}

civoshell_instance_create() {
	civoshellvar_instance_create=curl -H "$civoshelvar_apikeyheader" https://api.civo.com/v2/instances \
  -d "hostname=$civoshellvar_instance_hostname&size=$civoshellvar_instance_size&region=$civoshellvar_instance_region&public_ip=true&template=$civoshellvar_instance_OS&initial_user=$civoshellvar_instance_user&network_id=$civoshellvar_instance_networkid"
}

civoshell_instance_destroy() {

}

civoshell_instance_reboot() {

}

civoshell_instance_firewall() {

}

civoshell_instance_rebuild() {

}

civoshell_instance_restore() {

}

civoshell_instance_tags() {

}

civoshell_instance_upgrade() {

}
