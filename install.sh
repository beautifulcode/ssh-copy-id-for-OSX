#!/bin/sh
# Installs ssh-copy-id into /usr/local/bin

if [[ $(id -u) != 0 ]]; then
	if command -v sudo >/dev/null 2>&1; then
		SUDO="sudo"
	else
		echo >&2 "Requires sudo but it's not installed. Aborting."
		exit 1
	fi
fi

if git ls-files >& /dev/null &&  [[ -f ssh-copy-id.sh ]]; then
	$SUDO cp ssh-copy-id.sh /usr/local/bin/ssh-copy-id || { echo "Failed to install ssh-copy-id into /usr/local/bin."; exit 1; }
else
	$SUDO curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/ssh-copy-id.sh -o /usr/local/bin/ssh-copy-id || { echo "Failed to install ssh-copy-id into /usr/local/bin."; exit 1; }
	$SUDO chmod +x /usr/local/bin/ssh-copy-id || { echo "Failed to install ssh-copy-id into /usr/local/bin."; exit 1; }
fi
echo "Installed ssh-copy-id into /usr/local/bin."; exit 0;
