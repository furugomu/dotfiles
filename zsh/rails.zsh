rake() {
  if [ -s bin/rake ]; then
    bin/rake $*
  else
    command rake $*
  fi
}

bundle() {
  if [ -s bin/bundle ]; then
    bin/bundle $*
  else
    command bundle $*
  fi
}
