# Hola Bash!
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Execute the aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Execute the prompts
[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt

# Execute git completion
[[ -f ~/.git_completion ]] && source ~/.git_completion

# ---------------------
# Editor
# ---------------------
# set the default editor
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

# ---------------------
# Transfer.sh
# ---------------------
transfer() {
  # write to output to tmpfile because of progress bar
  tmpfile=$( mktemp -t transferXXX )
  curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
  cat $tmpfile | pbcopy;
  cat $tmpfile;
  rm -f $tmpfile;
}
