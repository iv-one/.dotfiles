export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:/usr/local/sbin"

# golang
if [ -d "$HOME/go" ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# gettext
if [ -d "/usr/local/opt/gettext/bin" ]; then
  export PATH="/usr/local/opt/gettext/bin:$PATH"
fi

# nix
if [ -d "$HOME/.nix-profile" ]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi
