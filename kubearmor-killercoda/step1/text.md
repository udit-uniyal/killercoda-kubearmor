First we need to install kubeArmor in our kubernetes envirionment

```plain
helm repo add kubearmor https://kubearmor.github.io/charts
helm repo update kubearmor
helm upgrade --install kubearmor-operator kubearmor/kubearmor-operator -n kubearmor --create-namespace
kubectl apply -f https://raw.githubusercontent.com/kubearmor/KubeArmor/main/pkg/KubeArmorOperator/config/samples/sample-config.yml
while [ "$(kubectl get po -n kubearmor | tail -n +2 | grep -v "Running\|Completed")" ]; do
  sleep 10
done
echo "All pods are now in 'Running' or 'Completed' state."
```{{exec}}

OR

```plain
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
karmor install
while [ "$(kubectl get po -n kubearmor | tail -n +2 | grep -v "Running\|Completed")" ]; do
  sleep 10
done
echo "All pods are now in 'Running' or 'Completed' state."
```{{exec}}


