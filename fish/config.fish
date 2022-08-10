if status is-interactive
    # Commands to run in interactive sessions can go here

    # direnv
    command --query direnv; and direnv hook fish | source
end

set -x PATH $HOME/bin $PATH

# go
set -x GOPATH $HOME/go
if test -d $GOROOT
    set -x PATH $GOROOT/bin $PATH
    set -x PATH $GOPATH/bin $PATH
end

# rbenv
if test -d $HOME/.rbenv
    set -x PATH $HOME/.rbenv/bin $PATH
    rbenv init - fish | source
end

# volta
set -l VOLTA_HOME "$HOME/.volta"
if test -d $VOLTA_HOME
    set -x PATH $VOLTA_HOME/bin $PATH
end

# docker rootless
set -l rootless_socket $XDG_RUNTIME_DIR/docker.sock
if test -S $rootless_socket
    set -x DOCKER_HOST unix://$rootless_socket
else
    set -x DOCKER_HOST unix:///var/run/docker.sock
end
