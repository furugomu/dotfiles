if status is-interactive
  # Commands to run in interactive sessions can go here
  alias d-c=docker-compose
  alias g=git

  # direnv
  command --query direnv; and direnv hook fish | source
end

# go
set -gx GOPATH $HOME/go

# rbenv
if test -d $HOME/.rbenv
  set fish_user_paths $HOME/.rbenv/bin
  rbenv init - fish | source
end

# volta
set -gx VOLTA_HOME "$HOME/.volta"
if test -d $VOLTA_HOME
  set fish_user_paths $VOLTA_HOME/bin
end
