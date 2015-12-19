# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Set key repeat rate 
xset r rate 150 80

# Turn off the touchpad
xinput set-prop 11 "Device Enabled" 0

# Adjust pointer sensitivity
xinput --set-prop 12 263 0.5
