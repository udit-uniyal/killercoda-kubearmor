First we need to install kubeArmor in our kubernetes envirionment

```plain
helm repo add kubearmor https://kubearmor.github.io/charts
helm repo update kubearmor
helm upgrade --install kubearmor-operator kubearmor/kubearmor-operator -n kubearmor --create-namespace
kubectl apply -f https://raw.githubusercontent.com/kubearmor/KubeArmor/main/pkg/KubeArmorOperator/config/samples/sample-config.yml
watch -n 10 'kubectl get pods -n kubearmor | grep -vE "Running|Completed" --quiet || echo "All pods are now in '"'"'Running'"'"' or '"'"'Completed'"'"' state." && pkill -f "watch -n 10"'

```{{exec}}

OR

```plain
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
karmor install
watch -n 10 'kubectl get pods -n kubearmor | grep -vE "Running|Completed" --quiet || echo "All pods are now in '"'"'Running'"'"' or '"'"'Completed'"'"' state." && pkill -f "watch -n 10"'
```{{exec}}


