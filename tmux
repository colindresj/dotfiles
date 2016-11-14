## Prefix binding
unbind C-b
set -g prefix C-Space
bind Space send-prefix

## Kill tmux
bind Q confirm-before kill-server

## Session bindings
# Choose session
bind S choose-session

# Rename session
bind N command-prompt "rename-session %%"

# Kill session
bind q confirm-before kill-session

## Window bindings
# New window
unbind t
bind t new-window

# Move windows
unbind .
unbind ,
bind , previous-window
bind . next-window

# Rename window
unbind n
bind n command-prompt "rename-window %%"

# Autoname windows by process
setw -g automatic-rename

# Split window
bind v split-window -h -p 50 -c "#{pane_current_path}"
bind h split-window -p 50 -c "#{pane_current_path}"

# Resize panes, vim style
bind - resize-pane -D 10
bind + resize-pane -U 10
bind < resize-pane -L 10
bind > resize-pane -R 10

# Easier and faster switching between next/prev window
# Hold down control, then prefix + , or .
bind C-, previous-window
bind C-. next-window

# Kill window
bind X kill-window

## Pane bindings
# Sync panes
bind e \
   setw synchronize-panes on \;\
   display "Sync Panes: ON"

bind E \
   setw synchronize-panes off \;\
   display "Sync Panes: OFF"

# Kill pane
bind x kill-pane

## General bindings
# Reload tmux.conf
unbind r
bind r source-file ~/.tmux.conf \; display " Reloaded!"

# Set mouse mode on with prefix + m
bind m \
   set -g mouse on \;\
   display "Mouse: ON"

# Set mouse mode off with prefix + M
bind M \
   set -g mouse off \;\
   display "Mouse: OFF"

# Vi mode
bind g copy-mode
bind -t vi-copy v begin-selection
bind -t vi-copy y copy-selection

# Vim navigator
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?)(diff)?$"'
bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
bind -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

# Vim focus events
set -g focus-events on

# Paste with p
unbind p
bind p paste

## Status bar
# Style the status bar
set -g status-interval 5
set -g status-bg colour236
set -g status-fg colour15
set -g status-left "#[fg=colour55,bg=colour98,bold] TMUX #{prefix_highlight}"
set -g status-right "#[fg=colour247]%H:%M #[fg=colour250,bg=colour240] #{battery_percentage} #[fg=colour241,bg=colour252] #S "
set -g @prefix_highlight_show_copy_mode "on"

# Style messages
set -g message-bg colour98
set -g message-fg colour15
set -g message-attr bold

# Highlight the active window
setw -g window-status-current-bg colour241
setw -g window-status-current-fg colour15
setw -g window-status-current-format " #I #W "

# Highlight the active pane
set -g pane-border-fg colour15
set -g pane-active-border-fg colour98

## Settings
# Start index at 1
set -g base-index 1
setw -g pane-base-index 1

# Faster key movements
set -s escape-time 0
set -sg repeat-time 600

# Bigger history
set -g history-limit 50000

# Longer message display time
set -g display-time 2000

# Set window notifications
setw -g monitor-activity on
set -g visual-activity on

# Rather than constraining window size to the maximum size of any client 
# connected to the *session*, constrain window size to the maximum size of any 
# client connected to *that window*. Much more reasonable.
setw -g aggressive-resize on

## tmux plugins
# prefix + I to install plugins
# prefix + U to update plugins
# prefix + alt + u to uninstall plugins
set -g @plugin "tmux-plugins/tpm"
set -g @plugin "tmux-plugins/tmux-sensible"
set -g @plugin "tmux-plugins/tmux-copycat"
set -g @plugin "tmux-plugins/tmux-yank"
set -g @plugin "tmux-plugins/tmux-battery"
set -g @plugin "tmux-plugins/tmux-prefix-highlight"
set -g @plugin "tmux-plugins/tmux-urlview"

# Initialize tmux plugin manager
run "~/.tmux/plugins/tpm/tpm"
