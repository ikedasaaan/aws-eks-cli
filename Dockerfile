FROM alpine:latest

WORKDIR /root

# Install tools
RUN apk --update --no-cache add \
    bash zsh curl jq  groff less jq git vim ncurses
# Version
ENV AWS_CLI_VERSION 1.16.250
ENV KUBECTL_VERSION 1.14.6
ENV HELM_VERSION 2.14.3
ENV ISTIO_VERSION 1.3.3 
ENV STERN_VERSION=1.11.0

# Zsh　関連ファイルを配置
COPY .zsh /root/.zsh
COPY .zshrc /root/

RUN apk --update --no-cache add python py-pip \
  && pip install --upgrade awscli==${AWS_CLI_VERSION} \
  && apk -v --purge del py-pip \
  && : "----- install eks-cli" \
  && curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp  \
  && mv /tmp/eksctl /usr/local/bin \
  && : "----- install kubectl" \
  && wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && : "----- install helm" \
  && curl -L https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar zxv -C /tmp \
  && mv /tmp/linux-amd64/helm /usr/local/bin/helm \
  && : "----- install kubectx kubens" \
  && git clone https://github.com/ahmetb/kubectx /tmp/kubectx \
  && mv /tmp/kubectx/kubectx /usr/local/bin/kubectx \
  && mv /tmp/kubectx/kubens /usr/local/bin/kubens \
  && : "-------- install tools --------" \
  && : "----- install k9s" \
  && curl -L https://github.com/derailed/k9s/releases/download/0.5.2/k9s_0.5.2_Linux_x86_64.tar.gz | tar zx  -C /tmp \
  && mv /tmp/k9s /usr/bin/  \
  && : "----- install stern" \
  && curl -L -o /usr/local/bin/stern https://github.com/wercker/stern/releases/download/${STERN_VERSION}/stern_linux_amd64 && chmod +x /usr/local/bin/stern \
  && : "----- install kubetail" \
  && curl -L https://github.com/johanhaleby/kubetail/archive/1.6.10.tar.gz | tar zx  -C /tmp \
  && mv /tmp/kubetail-1.6.10/kubetail /usr/bin/  \
  && : "-------- install completion --------" \
  && : "----- install fzf" \
  && git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf \
  && yes y | /root/.fzf/install \
  && : "----- install kube_ps1" \
  && curl -L -o /usr/local/bin/kube-ps1.sh https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh \
  && : "----- .vimrc create" \
  && echo 'set encoding=utf-8' >> /root/.vimrc \
  && echo 'set fenc=utf-8' >> /root/.vimrc \
  && echo ':syntax on"' >> /root/.vimrc


# share folder
RUN mkdir /root/share
RUN chmod -x /root/share

# kube .folder
RUN mkdir /root/.kube
RUN mkdir /root/.helm