export ZSH=/Users/mshenfield/.oh-my-zsh

ZSH_THEME="bullet-train"

# Disable marking untracked files under VCS as dirty. This makes repository
# status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  colorize
  docker
  gitfast
  osx
  pip
  yarn
)

source $ZSH/oh-my-zsh.sh
