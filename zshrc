#export PATH="$HOME/.rbenv/bin:$PATH:/usr/local/sbin"
#eval "$(rbenv init -)"

export EDITOR=vim

set -o vi

bindkey '^R' history-incremental-pattern-search-backward

export CLICOLOR=1

# Aliases
alias ll="ls -lahL"
alias restart="exec /bin/zsh -l"
alias g="git"
alias be='bundle exec'
alias ber='bundle exec rake'
alias berdbm='bundle exec rake db:migrate'
alias berc='bundle exec rails console'
alias bers='bundle exec rails server'
alias vimprune='find . -name ".*.sw*" -print0 | xargs -0 rm'
alias cls='git log | head -n 1 | sed "s/commit //" | pbcopy' # Copy last SHA
alias cop='git diff --name-only HEAD develop | xargs bundle exec rubocop'
alias pickbr='git branch | pick | xargs git checkout'
alias conflicts='vim $(git diff --name-only --diff-filter=U | tr "\n" " ")'
alias k='kubectl'
alias stamp='date -u +%Y.%m.%d.%H.%M.%S'
alias o='TMUX=  overmind'

# Functions

# Search for files containing a term in a Rails directory and open those files in Vim's args list
agvim() {
  vim $((ag $1 -l --ignore bin/ --ignore db --ignore log) | tr "\n" " ")
}

# z
. `brew --prefix`/etc/profile.d/z.sh

#
# Prompt
#

setopt prompt_subst

prompt_basename() {
  basename=$(pwd | xargs basename)
  echo "$basename | "
}

prompt_git_branch() {
  branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [ -n "$branch" ]; then
    echo "$branch | "
  fi
}

prompt_random_emoji() {
  emojis=(🐶 🐺 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐻 🐷 🐮 🐵 🐼 🐧 🐍 🐢 🐙 🐠 🐳 🐬 🐥 🦁 🦀 🐝 🐛)
  echo ${emojis[$RANDOM % 26]}
}

PROMPT='%F{cyan}$(prompt_basename)$(prompt_git_branch)$(prompt_random_emoji) >  %F{white}'

# Welcome
echo -e ""
echo -e "\033[0;31m (╯°□°）╯\033[1;33m ︵ \033[0;36m¡ʎɯǝɹǝſ 'ǝɯoɔlǝM"
echo -e ""
echo -e "             Welcome, Jeremy!\033[0;35m ノ(º_ºノ)"
echo -e ""

#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"
