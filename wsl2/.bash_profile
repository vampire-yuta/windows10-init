# Terraform
export PATH="$HOME/.tfenv/bin:$PATH"

# Golang
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"

#export GOPATH="$HOME/go"
export GOPATH="/mnt/c/Users/yuta/go/"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

exec $SHELL
