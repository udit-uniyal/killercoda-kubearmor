First we need to install kubeArmor in our kubernetes envirionment

```
helm repo add kubearmor https://kubearmor.github.io/charts
helm repo update 
helm upgrade --install kubearmor-operator kubearmor/kubearmor-operator -n kubearmor --create-namespace
kubectl apply -f https://raw.githubusercontent.com/kubearmor/KubeArmor/main/pkg/KubeArmorOperator/config/samples/sample-config.yml
sleep 8
kubectl wait --for=condition=ready --timeout=2m -n kubearmor pod -l kubearmor-app=kubearmor-operator
kubectl wait --for=condition=ready --timeout=2m -n kubearmor pod -l kubearmor-app=kubearmor-controller
kubectl wait --for=condition=ready --timeout=2m -n kubearmor pod -l kubearmor-app=kubearmor-relay
sleep 8
kubectl wait --for=condition=ready --timeout=2m -n kubearmor pod -l kubearmor-app=kubearmor
```{{exec}}

OR

```plain
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
karmor install
```{{exec}}


