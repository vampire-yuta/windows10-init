.PHONY:	init
.DEFAULT_GOAL := all

all: nvm completion golang init

nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

completion:
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
	chmod a+x ~/.git-completion.bash
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
	chmod a+x ~/.git-prompt.sh

golang:
	git clone https://github.com/syndbg/goenv.git ~/.goenv

init:
	source ~/.bashrc
