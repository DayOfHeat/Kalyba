# Kalyba

*A file launching CLI that believes Ranger was "very much mistaken"*

# Installation

Run `make clean install` in the installation folder

# Use

Use `kalyba` to launch. 

# Config

Edit `config` in the installation folder. Add new lines of the format `fileExtention command` where `fileExtention` is without the period. `$` in a command is replaced with the file. For example, to make `.txt` files open in neovim, add `txt neovim $`. 

# Uninstalling

Run `make uninstall` in the installation folder
