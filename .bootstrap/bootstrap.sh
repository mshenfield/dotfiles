#!/usr/bin/env bash

##############################################
# Helpers                                    #
##############################################

# Install the XCode Command Line Tools
function install_xcode() {
  # Exit if already installed
  xcode-select --print-path && return 0

  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done
}

# Install the Bullet Train zsh theme
function install_bullet_train() {
  # Clone or update the bullet train theme
  git clone https://github.com/caiogondim/bullet-train.zsh ~/Code/bullet-train.zsh || \
  pushd ~/Code/bullet-train.zsh && git pull && popd

  # Link the theme into the oh-my-zsh custom themes directory
  ln -sf ~/Code/bullet-train.zsh/bullet-train.zsh-theme ~/.oh-my-zsh/custom/themes/
}

##############################################
# Script                                     #
##############################################
# Exit after errors and print commands
set -e -v

# Ask for the administrator password upfront
sudo -v

# Homebrew taps - additional taps to enable Cask support for applications,
# fonts, and alternative release channels via `brew tap`
taps=(
  # Applications and the `brew cask` command
  caskroom/cask
  # Fonts (for font-droid-sans-mono-for-powerline)
  caskroom/fonts
  # Alternative release channels (for firefoxnightly and atom-beta)
  caskroom/versions
  # Formula for rcm
  thoughtbot/formulae
)

# Homebrew - packages to install via `brew install <formula>`
formulas=(
  # A fancy ls
  exa
  # Going to format an image at some point
  imagemagick
  # Best Python REPL
  ipython
  # The way Python package management should work
  pipenv
  # Updated Python2 for legacy apps and libs
  python2
  # Groovy Python3 for cool new apps and libs
  python3
  # rc file manager
  thoughtbot/formulae/rcm
  # Spotify command line API
  shpotify
  # Better Node package manager
  yarn
)

# Homebrew Cask - applications and fonts to install via `brew cask install <cask>`
casks=(
  # atom.io Beta channel
  atom-beta
  # Firefox nightly build 🤙
  firefoxnightly
  # Default iTerm2 font w/ Powerline support
  font-droid-sans-mono-for-powerline
  # Terminal emulator with extra features and configuration options
  iterm2
  # Windows management for cleaner workspaces
  spectacle
  # Preferred music consumption apparatus
  spotify
)

# Atom packages
# Note: This only includes top level packages, I'm letting Atom install any
# package dependencis
atom_packages=(
  # Quick notes in Atom
  atom-notes
  # The best Atom rST preview
  atom-rst-preview-docutils
  # Unicode character lookup/explorer
  character-table
  # Atom IDE - python support
  ide-python
  # rST language support
  language-restructuredtext
  # Multi-cursor enhancements
  multi-cursor
  # Quickly add/remove project folders from workspace
  project-folder
)

# Python - packages that aren't available via Homebrew
python3_packages=(
  # Python Language Server - backend for the Atom ide-python package
  python-language-server
)

# XCode
install_xcode

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# oh-my-zsh (no Homebrew formula)
(
  # Run in a subshell - the installation script spawns a new shell at the end so
  # this lets us avoid manually exiting
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
)

# Taps
for tap in "${taps[@]}"; do
  brew tap $tap
done

# Formulas
for formula in "${formulas[@]}"; do
  brew install $formula
done

# Casks
for cask in "${casks[@]}"; do
  brew cask install $cask
done

# Atom
apm-beta install --production "${atom_packages[@]}"

# Python3
pip3 install "${python3_packages[@]}"

# I keep my code in ~/Code
mkdir ~/Code

# Clone or pull dotfiles to ~/Code/dotfiles
git clone https://github.com/mshenfield/dotfiles ~/Code/dotfiles ||
pushd ~/Code/dotfiles && git pull && popd

# MacOS defaults
source ~/Code/dotfiles/.bootstrap/macos-defaults.sh

# Symlink the actual dotfiles. ".bootstrap" is automatically ignored
rcup -d ~/Code/dotfiles -x README.md

# Requires ~/Code and ~/.oh-my-zsh/themes
install_bullet_train

# Optionally restart
read -p 'Installation complete! Do you want to restart [y/N]' should_restart
if [ "$should_restart" = "y" ]; then
  sudo shutdown -r now
fi
