# ssh-copy-id for OSX

> Quick port of the useful unix utility `ssh-copy-id`

## Note: MacOS Sierra now includes an onboard `ssh-copy-id` in `/usr/bin` 

## Installation

Git clone & run install script

OR

`curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh | sh
`


## SSH-COPY-ID [man][man]

### NAME
`ssh-copy-id` - install your identity.pub in a remote machine's authorized_keys

### SYNOPSIS
ssh-copy-id [-i [identity_file]] [user@]machine

### DESCRIPTION

**ssh-copy-id** is a script that uses ssh to log into a remote machine (presumably using a login password, so password authentication should be enabled, unless
you've done some clever use of multiple identities)

It also changes the permissions of the remote user's home, `~/.ssh`, and `~/.ssh/authorized_keys` to remove group writability (which would otherwise prevent
you from logging in, if the remote `sshd` has StrictModes set in its configuration).

If the `-i` option is given then the identity file (defaults to `~/.ssh/identity.pub`) is used, regardless of whether there are any keys in your ssh-agent.
Otherwise, if this:

`ssh-add -L`

provides any output, it uses that in preference to the identity file.

If the `-i` option is used, or the ssh-add produced no output, then it uses the contents of the identity file. Once it has one or more fingerprints (by
whatever means) it uses ssh to append them to `~/.ssh/authorized_keys` on the remote machine (creating the file, and directory, if necessary)

### SEE ALSO

ssh(1), ssh-agent(1), sshd(8)

[man]: http://linux.die.net/man/1/ssh-copy-id
