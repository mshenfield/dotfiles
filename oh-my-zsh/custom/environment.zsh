### vim (instead of vi) as default editor
export EDITOR=vim

### RUST_SRC_PATH
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

### Enable shpotify's binary (/usr/local/bin/spotify) by disable the osx plugin spotify function
unfunction spotify
#### Also set an environment variable for my Discover Weekly playlist
export SPOTIFY_DISCOVER_WEEKLY_URI=spotify:user:spotify:playlist:37i9dQZEVXcQWbzrrcMat3
