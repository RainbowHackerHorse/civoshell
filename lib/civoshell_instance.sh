#!/bin/sh
# civoshell_instance

civoshell_instance() {
while :; do
		case $1 in
			region=)
				if [ "$2" ]; then
					for testinstanceregion in lon1
						do
							if [ "$testinstanceregion" = "$2" ]; then
						    	validregion=1
						    	break
							fi
						done;
					if [ "$validregion" = "1" ]; then
						civoshellvar_instance_region=$2
					else
						echo "Warning. $2 is not a valid CivoCloud region."
						echo "Please run civoshell regions to see a list of available regions."
						return 1
					fi
				fi
				exit
			;;
			hostname=)
				if [ "$2" ]; then
					civoshellvar_instance_hostname=$2
					civoshellcheck_instance_hostname=1
				else
					echo "Error. Please supply a hostname."
					return 1
				fi
			;;
			*)
				break
		esac
		shift
	done
	civoshell_instance_varchecks || return 1
}

civoshell_instance_varchecks() {
	if [ ! civoshellcheck_instance_hostname = 1 ]; then
		echo "Error. Hostname is required. Use civoshell instance create hostname=foo"
		return 1
	fi
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
