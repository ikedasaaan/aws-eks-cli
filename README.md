# aws-eks-cli
aws-eks-cli dockerfiles


## command
```
# build
$ make build
  
# run
$ make run

Please check MakeFile
```

## connection aws and eks
```:.env
# aws-cli
AWS_ACCESS_KEY_ID=<KEY_ID>
AWS_SECRET_ACCESS_KEY=<SECRET_ACCESS_KEY>
AWS_DEFAULT_REGION=<REGION>
```

```
$ aws eks --region <your-aws-region> update-kubeconfig --name <your-cluster-name>
```





Shell default 
  zsh

Installed
- [kubectx](https://github.com/ahmetb/kubectx)  
- [k9s](https://github.com/derailed/k9s)
- [kubetail](https://github.com/johanhaleby/kubetail)
- [stern](https://github.com/wercker/stern)
- [kube-ps1](https://github.com/jonmosco/kube-ps1)
