#!/bin/sh
# lib: civoshell_showhelp
# 
# Invocation: civoshell --help
# Description: Shows help information for civoshell
# 
# civoshell is (c) 2018 RainbowHackerHorse
# You can find the primary repository at https://github.com/RainbowHackerHorse/civoshell
# civoshell is released under the 2-Clause BSD license.
#
# This script is meant to be sourced from civoshell, and should NOT be executed on its own!

civoshell_showhelp() {
	if [ "$1" ]; then
		civoshell_showhelp_"${1}" || civoshell_showhelp_error "${1}"
	else 
		civoshell_showhelp_base
	fi
}

civoshell_showhelp_error() {
	echo "${1} is not a valid --help option."
	civoshell_errorcode
}

civoshell_showhelp_base() {
	cat << 'EOT'
civoshell is a CLI program that lets you interact with the CivoCloud API locally,
in an easy to use manner.
It is an alternative to the official civo client, which is written in Go, and available at:
https://github.com/absolutedevops/civo
civoshell is an open-source 3rd party project and is not affiliated with Absolute DevOps LTD.
civoshell does attempt to maintain compatibility with civo, however some differences will be seen 
from time to time. 

civoshell is (c) 2018 RainbowHackerHorse
You can find the primary repository at https://github.com/RainbowHackerHorse/civoshell
civoshell is released under the 2-Clause BSD license.

civoshell commands:

--help
	Shows this help
	You can also use --help command for any command civoshell offers.
	For example:
		civoshell --help apikeys
		This will print the help information for: civoshell apikeys

		Likewise,
		civoshell --help instance will print the help for: civoshell instance

civoshell instance
	The instance option allows you to interact with an instance.
	For example:
	civoshell instance create foo
		This command will create an instance, named foo

EOT
}