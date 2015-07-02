export PATH="$HOME/.rbenv/bin:$PATH:/usr/local/sbin"
eval "$(rbenv init -)"

export EDITOR=vim

# REE for LivingSocial
export RUBY_HEAP_FREE_MIN=1024
export RUBY_GC_HEAP_INIT_SLOTS=4000000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_GC_MALLOC_LIMIT=500000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

# Aliases
alias ll="ls -lahL"
export CLICOLOR=1
alias restart="exec /bin/bash -l"
alias g="git"
alias test="bundle exec ruby -I test"
alias ptest="script/run_tests_summary"
alias prod="ssh jstuckey@app-shell01.iad.livingsocial.net"
alias racoon="sudo launchctl stop com.apple.racoon ; sudo discoveryutil mdnsflushcache ; sudo discoveryutil udnsflushcaches ; sudo launchctl start com.apple.racoon"
alias bgm='BUNDLE_GEMFILE="./Gemfile.mine"'
alias bashpro='vim ~/.bash_profile'
alias gitcon='vim ~/.gitconfig'
alias vimrc='vim ~/.vimrc'
alias db='mysql -u root deals_development'
alias dbt='mysql -u root pipeline_test'
alias be='bundle exec'
alias ber='bundle exec rake'
alias bertu='bundle exec rake test:units'
alias mvim='open -a MacVim .'
alias gcob='git checkout -b'
alias gp='git push origin `g cb` && git pr'

# z
. `brew --prefix`/etc/profile.d/z.sh

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
