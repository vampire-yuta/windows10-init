.PHONY:	init
.DEFAULT_GOAL := all

all: packages nvm completion golang kubectl aws terraform

packages:
	sudo apt-get -y install unzip wget xinput net-tools azure-cli peco

nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

completion:
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
	chmod a+x ~/.git-completion.bash
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
	chmod a+x ~/.git-prompt.sh

golang:
	git clone https://github.com/syndbg/goenv.git ~/.goenv

kubectl:
	sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
	echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
	sudo apt-get update
	sudo apt-get install -y kubectl

aws:
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	aws --version

eksctl:
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
	sudo mv /tmp/eksctl /usr/local/bin
	eksctl version

terraform:
	git clone https://github.com/tfutils/tfenv.git ~/.tfenv

