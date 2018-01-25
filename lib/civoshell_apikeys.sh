#!/bin/sh
# lib: civoshell_apikeys
# 
# Invocation: civoshell api
# Description: Functions for using, viewing, or setting your CivoCloud API Key for use in civoshell
# 
# civoshell is (c) 2018 RainbowHackerHorse
# You can find the primary repository at https://github.com/RainbowHackerHorse/civoshell
# civoshell is released under the 2-Clause BSD license.
#
# This script is meant to be sourced from civoshell, and should NOT be executed on its own!

# I'd hash the key but their API doesn't support that yet so.... *shrug* #

civoshell_apikeys() {
	civoshelvar_apikeyheader="Authorization: bearer $civoshellvar_userapikey"

}

civoshell_checkapikey() {
	if [ ! -d "$HOME"/.config ]; then
		mkdir "$HOME"/.config
	fi
	if [ ! -f "$HOME"/.config/.apikey.civoshell ]; then
		echo "Error. No API Key found. Creating your API Key file."
		civoshell_userapikey_create
	fi
	. "$HOME"/.config/.apikey.civoshell
}

civoshell_userapikey_create() {
	echo "Please enter your CivoCloud API Key"
	echo "You can find it at: https://www.civo.com/api"
	echo "Please ensure you do NOT include any spaces!"
	read -r -p "CivoShell API Key:" civoshellvar_setuserapikey </dev/tty
	sleep 2
	echo "Creating $HOME/.config/.apikey.civoshell"
	cat > "$HOME"/.config/.apikey.civoshell << EOF
#!/bin/sh
civoshellvar_userapikey="$civoshellvar_setuserapikey"
EOF
	echo "Done! Now testing!"
	if [ -f "$HOME"/.config/.apikey.civoshell ]; then
		echo "API Key successfully created. Now importing."
	else 
		echo "Something went wrong! Bailing!"
		echo "Please check permissions on $HOME/.config/.apikey.civoshell"
		exit 1
	fi
	. "$HOME"/.config/.apikey.civoshell
}
