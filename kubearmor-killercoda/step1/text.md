First we need to install kubeArmor in our kubernetes envirionment

```plain
helm repo add kubearmor https://kubearmor.github.io/charts
helm repo update 
helm upgrade --install kubearmor-operator kubearmor/kubearmor-operator -n kubearmor --create-namespace
kubectl apply -f https://raw.githubusercontent.com/kubearmor/KubeArmor/main/pkg/KubeArmorOperator/config/samples/sample-config.yml
chmod +x setup.sh && ./setup.sh
```{{exec}}

OR

```plain
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
karmor install
chmod +x setup.sh && ./setup.sh
```{{exec}}


