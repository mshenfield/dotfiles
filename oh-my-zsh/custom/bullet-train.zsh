### Custom configuration for the bullet-train theme
BULLETTRAIN_PROMPT_ORDER=(
  status
  context
  screen
  dir
  virtualenv
  nvm
  git
  cmd_exec_time
)

# Point the way
BULLETTRAIN_PROMPT_CHAR=""
for color in red blue yellow; do
  # https://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text
  BULLETTRAIN_PROMPT_CHAR+="%{$fg_bold[$color]%}❱%{$reset_color%}"
done

# Set default user to hide the user prompt normally
BULLETTRAIN_CONTEXT_DEFAULT_USER=mshenfield

# Show exit status
BULLETTRAIN_STATUS_EXIT_SHOW=true

# Only show exec time for really long commands (> 1 minute)
BULLETTRAIN_EXEC_TIME_ELAPSED=60

# Add a space to the python venv
BULLETTRAIN_VIRTUALENV_PREFIX='🐍 '

# Don't need an icon for clean state
BULLETTRAIN_GIT_CLEAN=''
