#!/usr/bin/env bash

# Install the XCode Command Line Tools
function install_xcode() {
  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done
}

# Install basic dependencies
installs=(
  # XCode
  'install_xcode'
  # Homebrew
  'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  # oh-my-zsh doesn't have a Homebrew formula
  'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
)

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
  # Going to format an image at some point
  imagemagick
  # Best Python REPL
  ipython
  # The way Python package management should work
  pipenv
  # Updated Python2 for legacy apps and libs
  python2
  # Groovy Python3 for cool new apps and libs
  "python3 --devel"
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
python3_packages = (
  # Python Language Server - backend for the Atom ide-python package
  pyls
)

# ~ - Extra not-dot home directories
not_dots=(
  # I keep my code in ~/code
  code
)

# Wishlist
# * re-map caps lock to control
# * set file extensions to to be opened with Atom (json, yaml, py, rb, txt, md, sh, zsh)
# * direnv - automatically shell into `pipenv` if shell into directory w/ it

# Install X-Code
# iTerm Plist, custom Powerline font, and custom theme
# Menu bar: hide the Time Machine, Volume, User, Bluetooth, Spotlight, and AirPlay icons, set clock to 24h,
# Spotify preferences: increased music quality, hidden sidebar, save a few favorite albums
# Turn on night shift

for cmd in $installs; do
  $cmd
done

# Taps
brew tap "${taps[@]}"

# Formulas
brew install "${formulas[@]}"

# Casks
brew cask install "${casks[@]}"

# Atom
apm install --production "${atom_packages[@]}"

# Python3
pip3 install "${python3_packages[@]}"

# not-dot directories
for not_dot in $not_dots; do
  mkdir -p ~/$not_dot
done

# Clone dotfiles to ~/.dotfiles
git clone https://github.com/mshenfield/dotfiles ~/.dotfiles

# MacOS defaults
source ~/.dotfiles/.install/_defaults.sh

# Symlink the actual dotfiles. All files/folders starting w/ a dot are
# automatically ignored by `rcup`, and the directory defaults to ~/.dotfiles
rcup -x README.md
