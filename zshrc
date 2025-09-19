export EDITOR=vim

set -o vi

bindkey '^R' history-incremental-pattern-search-backward

export CLICOLOR=1

# Aliases
alias ll="ls -lahL"
alias restart="exec /bin/zsh -l"
alias g="git"
alias test="bundle exec ruby -I test"
alias racoon="sudo launchctl stop com.apple.racoon ; sudo discoveryutil mdnsflushcache ; sudo discoveryutil udnsflushcaches ; sudo launchctl start com.apple.racoon"
alias bgm='BUNDLE_GEMFILE="./Gemfile.mine"'
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
alias tf='terraform'
alias stamp='date -u +%Y.%m.%d.%H.%M.%S'
alias iweb='docker exec -it inventory_web_1'
alias py='python3'

# Functions

# Search for files containing a term in a Rails directory and open those files in Vim's args list
agvim() {
  vim $((ag $1 -l --ignore bin/ --ignore db --ignore log) | tr "\n" " ")
}

openmr() {
  url_base=$(git remote -v | grep "origin.*(push)" | sed "s/^.*://" | sed "s/\.git.*//")
  source_branch=$(git rev-parse --abbrev-ref HEAD)
  target_branch=$(git log --oneline \
  | cut -f 1 -d' ' \
  | (while read commit ; do
       other_branches="$(git branch --contains $commit | egrep -v '^\* ')"
       if [ -n "${other_branches}" ] ; then
         echo $other_branches
         break
       fi
     done) | tail -n 1 | sed "s/ //g")
  open "https://gitlab.com/$url_base/-/merge_requests/new?merge_request%5Bsource_branch%5D=$source_branch&merge_request%5Btarget_branch%5D=$target_branch"
}

openpr() {
  repo_name=$(basename $(pwd))
  branch_name=$(git rev-parse --abbrev-ref HEAD)
  open "https://github.com/optoro/$repo_name/pull/new/$branch_name"
}

kns() {
  env=`echo $1 | cut -f 1 -d '-'`
  kubectl config use-context $env
  kubectl config set-context --current --namespace="$1"

  if [ $env = "production" ]; then
    PROMPT=$PROD_PROMPT
  else
    PROMPT=$NON_PROD_PROMPT
  fi
}

kbash() {
  kubectl exec -it $1 -- bash
}

kweb() {
  web="`kubectl get pods | grep web | sort -R | head -n 1 |  awk '{print $1}'`"
  kubectl exec -it $web -- bash
}

kshot() {
  one_shot="`kubectl get pods | grep ^one-shot | sort -R | head -n 1 |  awk '{print $1}'`"
  kubectl exec -it $one_shot -- bash
}

kimg() {
  kubectl get pods -o custom-columns="CONTAINER:.spec.containers[0].name,IMAGE:.spec.containers[0].image"
}

gproxy() {
  if [ -z $1 ]
  then
    echo "Need an environment argument such as staging, sandbox, or production"
    return
  fi

  case "$1" in
    bcdr-sandbox) proxy_port="8884";;
    bcdr-production) proxy_port="8885";;
    testing) proxy_port="8886";;
    staging) proxy_port="8887";;
    sandbox) proxy_port="8888";;
    production) proxy_port="8889";;
  esac

  if [[ $1 == bcdr* ]]
  then
    zone="us-west1-a"
    environment=`echo $1 | sed "s/bcdr-//"`
    suffix="-us-west1"
  else
    zone="us-central1-a"
    environment=$1
    suffix=""
  fi

  ps aux | grep ${proxy_port}:localhost:8888 | grep -v grep | awk '{print $2}' | xargs kill
  gcloud compute ssh bastion-optoro-$environment-service${suffix} --project optoro-$environment-service --zone $zone -- -L ${proxy_port}:localhost:8888 -N -q -f
}

alias kproxy="gproxy"

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

export PATH="$HOME/.rbenv/bin:$PATH:/usr/local/sbin"
eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jstuckey/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jstuckey/Downloads/google-cloud-sdk/path.zsh.inc'; fi

export HELM_REGISTRY_CONFIG="$HOME/.docker/config.json"
export HELM_EXPERIMENTAL_OCI=1

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export CLOUDSDK_PYTHON='/Users/jstuckey/.pyenv/shims/python'
export CLOUDSDK_PYTHON_SITEPACKAGES=1
