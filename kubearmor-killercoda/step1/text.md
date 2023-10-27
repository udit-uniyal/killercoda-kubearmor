First we need to install kubeArmor in our kubernetes envirionment

```
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
karmor install --image=kubearmor/kubearmor:v1.0.1
```{{exec}}


