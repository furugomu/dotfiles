export EDITOR=vi
export LANG=ja_JP.UTF-8
export PATH
PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
path+=~/opt/bin
path+=/snap/bin

# go
path+=/usr/local/go/bin
export GOPATH=$HOME/go
path+=$GOPATH/bin

# python
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
if [ -d "$PYENV_ROOT" ]; then
  eval "$(pyenv init -)"
fi
if [ -d "$PYENV_ROOT/plugins/pyenv-vitualenv" ]; then
  eval "$(pyenv virtualenv-init -)"
fi

# ruby
if [[ -d "$HOME/.rbenv" ]]; then
  PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# node
if [[ -s ~/.nvm/nvm.sh ]]; then
  . ~/.nvm/nvm.sh  # This loads NVM
fi
path+=node_modules/.bin

# direnv
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

[ -f $HOME/.zshenv.$(hostname) ] && source $HOME/.zshenv.$(hostname)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
