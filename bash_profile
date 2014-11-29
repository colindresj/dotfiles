# Hola Bash!
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Execute the aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Execute the prompts
[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt

# Execute git completion
[[ -f ~/.git_completion ]] && source ~/.git_completion

# ---------------------
# Sublime
# ---------------------
# set as the default editor
export EDITOR="mvim"

# ---------------------
# Postgres
# ---------------------
# Make sure we're pointing to the Postgres App's psql
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
export PG_USERNAME="JC"

# ---------------------
# MySQL
# ---------------------
export MYSQL_USERNAME="root"
export MYSQL_PASS="loginmysql"

# ---------------------
# Rbenv
# ---------------------
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ---------------------
# Tab Improvements
# ---------------------
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'

# ---------------------
# Titleize Tabs
# ---------------------
title() {
  TITLE=$*;
  export PROMPT_COMMAND='echo -ne "\033]0;$TITLE\007"'
}

# ---------------------
# Password Gen and Hashing
# ---------------------
passgen() {
  if [[ $2 ]]; then
    openssl rand -base64 10 | md5 | head -c$1; echo;
  else
    openssl rand -base64 $1 | head -c$1; echo;
  fi
}

md5hash() {
  md5 -qs $1;
}

# ---------------------
# Bash History
# ---------------------
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE


#----------------------
# Rails
# ---------------------
# Rails composer
rails_composer() { rails new "$@" -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb; }

#----------------------
# Nodejs
# ---------------------
export NODE_PATH="/usr/local/lib/node_modules"
export PATH="/usr/local/share/npm/bin:$PATH"

# ---------------------
# Cask
# ---------------------
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
