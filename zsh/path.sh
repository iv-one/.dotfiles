# golang
if [ -d "/usr/local/go" ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# gettext
if [ -d "/usr/local/opt/gettext/bin" ]; then
  export PATH="/usr/local/opt/gettext/bin:$PATH"
fi

