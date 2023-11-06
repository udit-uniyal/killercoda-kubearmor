First, install Helm using the following commands:

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```{{exec}}

Now, install KubeArmor using the following commands:
```
helm repo add kubearmor https://kubearmor.github.io/charts
helm repo update kubearmor
helm upgrade --install kubearmor-operator kubearmor/kubearmor-operator -n kubearmor --set autoDeploy=true --create-namespace
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
curl -sSL https://raw.githubusercontent.com/kubearmor/KubeArmor/main/contribution/Killercoda-Kubearmor/kubearmor-installation-view.sh | bash
```{{exec}}
