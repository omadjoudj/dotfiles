# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Enable SCLs
source scl_source enable sclo-git25
source scl_source enable sclo-vagrant1
