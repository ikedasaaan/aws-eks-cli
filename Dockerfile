FROM alpine:3.10

WORKDIR /root

# Install tools
RUN apk --update --no-cache add \
    bash curl jq bash-completion groff less jq git vim

# install AWS CLI
ENV AWS_CLI_VERSION 1.16.250
ENV KUBECTL_VERSION 1.14.7
ENV HELM_VERSION 2.14.3

RUN apk --update --no-cache add python py-pip \
  && pip install --upgrade awscli==${AWS_CLI_VERSION} \
  && apk -v --purge del py-pip \
  && : "install eks-cli" \
  && curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp  \
  && mv /tmp/eksctl /usr/local/bin \
  && : "install kubectl" \
  && wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && : "install helm" \
  && curl -L https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar zxv -C /tmp \
  && mv /tmp/linux-amd64/helm /usr/local/bin/helm \
  && : "install kubectx" \
  && git clone https://github.com/ahmetb/kubectx /tmp/kubectx \
  && mv /tmp/kubectx/kubectx /usr/local/bin/kubectx \
  && mv /tmp/kubectx/kubens /usr/local/bin/kubens \
  && : "install kube_ps1" \
  && curl -L -o /usr/local/bin/kube-ps1.sh https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh \
  && : ".bashrc create" \
  && cat /dev/null > /root/.bashrc \
  && echo complete -C '/usr/bin/aws_completer' aws  >> /root/.bashrc \
  && echo '. <(kubectl completion bash)' >> /root/.bashrc \
  && echo '. <(eksctl completion bash)'  >> /root/.bashrc \
  && echo '. /usr/local/bin/kube-ps1.sh' >> /root/.bashrc \
  && : ".vimrc create" \
  && echo 'set encoding=utf-8"' >> /root/.vimrc \
  && echo 'set fenc=utf-8"' >> /root/.vimrc \
  && echo ':syntax on"' >> /root/.vimrc

RUN mkdir /root/share
RUN chmod -x /root/share

ENV PS1="[\u@\h:\w]$ "

