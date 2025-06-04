if status is-interactive
    # Commands to run in interactive sessions can go here

    # direnv
    command --query direnv; and direnv hook fish | source
end

set -x PATH $HOME/bin $PATH
set -x PATH $HOME/opt/bin $PATH

# go
# set -x GOPATH $HOME/go
# if test -d $GOROOT
#     set -x PATH $GOROOT/bin $PATH
#     set -x PATH $GOPATH/bin $PATH
# end

# rbenv
if test -d $HOME/.rbenv
    set -x PATH $HOME/.rbenv/bin $PATH
    rbenv init - fish | source
end

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
if test -d $PYENV_ROOT
    set -x PATH $PYENV_ROOT/bin $PATH
    pyenv init - | source
    status --is-interactive; and source (pyenv virtualenv-init -|psub)
end

# docker rootless
set -l rootless_socket $XDG_RUNTIME_DIR/docker.sock
if test -S $rootless_socket
    # set -x DOCKER_HOST unix://$rootless_socket
else
    # set -x DOCKER_HOST unix:///var/run/docker.sock
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# deno
set --export DENO_INSTALL "$HOME/.deno"
set --export PATH $DENO_INSTALL/bin $PATH

#volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
