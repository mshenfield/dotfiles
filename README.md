# Max Shenfield's [Dotfiles](https://dotfiles.github.io/)
Reproducing my MacOS setup since 2017.

## Installation
`sh -c "$(curl https://raw.githubusercontent.com/mshenfield/dotfiles/master/.bootstrap/bootstrap.sh)"`

The installation script installs this repository into `~/.dotfiles`, symlinks my dotfiles and installs the command line utilities and MacOS applications I use consistently:

* [Atom](https://atom.io) - a hackable text editor with [my settings](atom) and [preferred packages](.bootstrap/bootstrap.sh#L72)
* [Firefox Nightly](https://www.mozilla.org/en-US/firefox/channel/desktop/#nightly) - a web browser that you can pat yourself on the back about
* [iTerm2](https://iterm2.com/) - a fancy(er) terminal emulator for MacOS with [nice defaults](.bootstrap/_defaults.sh#L288) and a [custom default profile](.bootstrap/iterm2/dynamic-profiles.json)
* [oh-my-zsh](http://ohmyz.sh/) - a community driven zsh framework, with sensible [installation](.bootstrap/bootstrap.sh#L23) and [config](zshrc)[uration](oh-my-zsh/custom)
* [MacOS defaults](.bootstrap/defaults.sh) - includes [minimal tray icons](.bootstrap/_defaults.sh#L48-L64)

The actual symlinking of dotfiles is done by [Thoughtbot's `rcm`](http://thoughtbot.github.io/rcm/rcm.7.html). The [.bootstrap](.bootstrap) directory and [README](README.md) are excluded from symlinking.

## Wishlist
* Map Caps Lock to Control key
* Set file extensions to to be opened with `Atom` (json, yaml, py, rb, txt, md, sh, zsh)
* [`direnv`](https://direnv.net/) - configure to automatically shell into `pipenv` when `cd`ing into a `Pipenv` directory
* Turn on [night shift](https://support.apple.com/en-us/HT207513)
* Automatically enable accessibility access for Spectacle.app
* Configure Spectacle to start at login and run as background app
* Login options
  * Custom icon on login screen
  * Show username and password
  * Disallow guest users
  * Disable fast switching menu item
* [Tap to click](.bootstrap/_defaults.sh#L78) doesn't work

## License
[MIT](https://opensource.org/licenses/MIT)
