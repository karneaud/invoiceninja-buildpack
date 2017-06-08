# sed -l basically makes sed replace and buffer through stdin to stdout
# so you get updates while the command runs and dont wait for the end
# e.g. npm install | indent
indent() {
  # if an arg is given it's a flag indicating we shouldn't indent the first line, so use :+ to tell SED accordingly if that parameter is set, otherwise null string for no range selector prefix (it selects from line 2 onwards and then every 1st line, meaning all lines)
  local c="${1:+"2,999"} s/^/       /"
  case $(uname) in
    Darwin) sed -l "$c";; # mac/bsd sed: -l buffers on line boundaries
    *)      sed -u "$c";; # unix/gnu sed: -u unbuffered (arbitrary) chunks of data
  esac
}
