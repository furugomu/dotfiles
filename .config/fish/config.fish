if status is-interactive
    # Commands to run in interactive sessions can go here
    alias d-c=docker-compose
    alias g=git

    # rbenv
    set -x PATH $HOME/.rbenv/bin $PATH
    test -x $HOME/.rbenv/bin/rbenv; and rbenv init - | source

    # volta
    set -x PATH $HOME/.volta/bin $PATH
end

# go
set -x GOPATH $HOME/go
set -x GOROOT /usr/local/go
set -x PATH $GOROOT/bin $PATH
