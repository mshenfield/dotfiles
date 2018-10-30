##########################
# Aliases for oh-my-zsh  #
##########################

### Set sudo to never save credentials by aliasing it to `sudo -k`
### Leave a space at the end so arguments are checked for aliases as well
### https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo#22043
alias sudo="sudo -k "

### Homebrew installed Python3
ln -sf /usr/local/bin/python3 /usr/local/bin/python
ln -sf /usr/local/bin/pip3 /usr/local/bin/pip

### Alias Atom Beta command line tools to Atom
alias atom=atom-beta
alias apm=apm-beta

### Alias ls to exa, a saner default. This might be dangerous for build scripts ¯\_(ツ)_/¯
alias ls=exa

### Alias play to "spotify play"
alias play="spotify play"
