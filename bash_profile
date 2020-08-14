export PATH="$HOME/.rbenv/bin:$PATH:/usr/local/sbin"
eval "$(rbenv init -)"

export EDITOR=vim

set -o vi

export CLICOLOR=1

# Aliases
alias ll="ls -lahL"
alias restart="exec /bin/bash -l"
alias g="git"
alias test="bundle exec ruby -I test"
alias racoon="sudo launchctl stop com.apple.racoon ; sudo discoveryutil mdnsflushcache ; sudo discoveryutil udnsflushcaches ; sudo launchctl start com.apple.racoon"
alias bgm='BUNDLE_GEMFILE="./Gemfile.mine"'
alias bashpro='vim ~/.bash_profile'
alias gitcon='vim ~/.gitconfig'
alias vimrc='vim ~/.vimrc'
alias be='bundle exec'
alias ber='bundle exec rake'
alias bertu='bundle exec rake test:units'
alias berdbm='bundle exec rake db:migrate'
alias berc='bundle exec rails console'
alias bers='bundle exec rails server'
alias befs='bundle exec foreman start'
alias mvim='open -a MacVim .'
alias gp='git push origin `g cb` && git pr'
alias vimprune='find . -name ".*.sw*" -print0 | xargs -0 rm'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias cls='git log | head -n 1 | sed "s/commit //" | pbcopy' # Copy last SHA
alias cop='git diff --name-only HEAD develop | xargs bundle exec rubocop'
alias pickbr='git branch | pick | xargs git checkout'
alias conflicts='vim $(git diff --name-only --diff-filter=U | tr "\n" " ")'
alias k='kubectl'
alias stamp='date -u +%Y.%m.%d.%H.%M.%S'

# Functions

# Search for files containing a term in a Rails directory and open those files in Vim's args list
agvim() {
  vim $((ag $1 -l --ignore bin/ --ignore db --ignore log) | tr "\n" " ")
}

kns() {
  if [[ $1 =~ ^production ]]; then
    kubectl config use-context prod
  else
    kubectl config use-context non-prod
  fi

  kubectl config set-context --current --namespace="$1"
}

kbash() {
  kubectl exec -it $1 bash
}

kweb() {
  web="`kubectl get pods | grep ^web | sort -R | head -n 1 |  awk '{print $1}'`"
  kubectl exec -it $web bash
}

# z
. `brew --prefix`/etc/profile.d/z.sh

# git tab completion
source ~/.git-completion.bash

# Prompt
git_branch='`git rev-parse --abbrev-ref HEAD 2> /dev/null | sed s/^/\ \|\ /`'
emojis=(🐶 🐺 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐻 🐷 🐮 🐵 🐼 🐧 🐍 🐢 🐙 🐠 🐳 🐬 🐥 🦁 🦀 🐝 🐛)
emoji='`echo ${emojis[$RANDOM % 26]}`'
PS1="\[\033[0;36m\]\W$git_branch | $emoji  > \[\e[0m\]"


# Old welcome
#echo -e "  🐻        🐨        🐼 "
#echo -e "\033[0;31m\n  --------------------"
#echo -e "\033[0;31m  - \033[0;36mWelcome, Jeremy! \033[0;31m-"
#echo -e "\033[0;31m  --------------------\n"
#echo -e "  🐶        🐭        🐱 "

# Welcome
echo -e ""
echo -e "\033[0;31m (╯°□°）╯\033[1;33m ︵ \033[0;36m¡ʎɯǝɹǝſ 'ǝɯoɔlǝM"
echo -e ""
echo -e "             Welcome, Jeremy!\033[0;35m ノ(º_ºノ)"
echo -e ""


# Triton env variables for work
export SDC_ACCOUNT=jstuckey
export SDC_URL=https://api.us-east.optoro.io
export SDC_KEY_ID=ac:84:28:74:de:8d:91:20:8a:0b:54:9b:3c:a1:48:43

alias dw='hammer exec component development unit_financial_event_writer'
alias web='bundle exec hammer exec component web -e development'
alias webbe='bundle exec hammer exec component web -e development bundle exec'
alias webber='bundle exec hammer exec component web -e development bundle exec rake'
#alias hammer='bundle exec hammer'

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
