# Kalyba

*How fair! How modest! How discreet! How bashfully demure!*

A simple and configurable file launching CLI
 
# Installation

Run `make clean install` in the installation folder

# Use

Use `kalyba` to launch. 

See man page for use flags.

# Config

Edit `config` in the installation folder. Add new lines of the format `fileExtention command` where `fileExtention` is without the period. `$` in a command is replaced with the file. For example, to make `.txt` files open in neovim, add `txt neovim $`. Use `system` for files starting with `.` such as `.xinit`. Use `none` for files without an extention, such as a `LICENSE` file. Use `other` for a file without another rule applied to it. 

# Uninstalling

Run `make uninstall` in the installation folder

