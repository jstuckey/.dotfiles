export PATH="$HOME/.rbenv/bin:$PATH:/usr/local/sbin"
eval "$(rbenv init -)"

export EDITOR=vim

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
alias vimprune='(find . -name .*.swp -print0 | xargs -0 rm) && (find . -name .*.swo -print0 | xargs -0 rm)'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias cls='git log | head -n 1 | sed "s/commit //" | pbcopy' # Copy last SHA
alias cop='bundle exec rubocop'
alias spec='bundle exec rspec'

# z
. `brew --prefix`/etc/profile.d/z.sh

# git tab completion
source ~/.git-completion.bash

# Prompt
git_branch='`git rev-parse --abbrev-ref HEAD 2> /dev/null | sed s/^/\ \|\ /`'
emojis=(🐶 🐺 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐻 🐷 🐮 🐵 🐼 🐧 🐍 🐢 🐙 🐠 🐳 🐬 🐥)
emoji='`echo ${emojis[$RANDOM % 22]}`'
PS1="\[\033[0;36m\]\T | \W$git_branch | $emoji  > \[\e[0m\]"


# Welcome
echo -e "  🐻        🐨        🐼 "
echo -e "\033[0;31m\n  --------------------"
echo -e "\033[0;31m  - \033[0;36mWelcome, Jeremy! \033[0;31m-"
echo -e "\033[0;31m  --------------------\n"
echo -e "  🐶        🐭        🐱 "
