# ~/.bashrc: executed by bash(1) for non-login shells.

# Automates Docker Compose update: stop, pull, up -d, with optional logs.
function update_docker() {
  echo "Stopping Docker Compose services..."
  docker compose stop

  echo "Pulling latest images..."
  docker compose pull

  echo "Starting Docker Compose services in detached mode..."
  docker compose up -d

  # If 'logs' is the first argument, follow logs afterward
  if [ "$1" == "logs" ]; then
    echo "--- Following logs (Press Ctrl+C to exit) ---"
    docker compose logs -f
  fi
}

## Options
# colored prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# add date and time to history
HISTTIMEFORMAT="%F %T "
# include bin in home
export PATH=~/bin:$PATH

## Let there be color in grep!
export GREP_OPTIONS=' — color=auto'

## `ls' colorized and alias
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

## avoid making mistakes
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

## Usefull Commands
# dir movement
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias add='apt install'
alias update='apt update'
alias remove='apt remove'
alias clean='apt autoremove && sudo apt clean'
