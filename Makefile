.PHONY:	init
.DEFAULT_GOAL := all

all: packages nvm completion golang kubectl aws terraform

packages:
	sudo apt-get -y install unzip wget xinput net-tools azure-cli jq

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
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl
	kubectl version --client

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

docker:
	sudo apt-get -y remove docker docker-engine docker.io containerd runc
	sudo apt-get -y update
	sudo apt-get -y install \
	    apt-transport-https \
	    ca-certificates \
	    curl \
	    gnupg-agent \
	    software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	   $(lsb_release -cs) \
	   stable"
	sudo apt-get -y update
	sudo apt-get -y install docker-ce docker-ce-cli containerd.io
	apt-cache madison docker-ce
	sudo apt-get -y install docker-ce=5:19.03.13~3-0~ubuntu-bionic docker-ce-cli=5:19.03.13~3-0~ubuntu-bionic containerd.io
	sudo groupadd docker
	sudo usermod -a -G docker $USER
	
docker-compose:
	sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	

fish:
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
	fisher install evanlucas/fish-kubectl-completions
	fisher install dracula/fish
