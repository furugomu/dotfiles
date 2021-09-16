if status is-interactive
  # Commands to run in interactive sessions can go here
  alias d-c=docker-compose
  alias g=git

  # direnv
  command --query direnv; and direnv hook fish | source
end

# go
set -x GOPATH $HOME/go
if test -d $GOROOT
  set -x PATH $GOROOT/bin $PATH
end

# rbenv
if test -d $HOME/.rbenv
  set -x PATH $HOME/.rbenv/bin $PATH
  rbenv init - fish | source
end

# volta
set -gx VOLTA_HOME "$HOME/.volta"
if test -d $VOLTA_HOME
  set -x PATH $VOLTA_HOME/bin $PATH
end
