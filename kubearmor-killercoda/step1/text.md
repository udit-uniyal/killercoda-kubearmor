First we need to install kubeArmor in our kubernetes envirionment

```plain
helm repo add kubearmor https://kubearmor.github.io/charts
helm repo update 
helm upgrade --install kubearmor-operator kubearmor/kubearmor-operator -n kubearmor --create-namespace
kubectl apply -f https://raw.githubusercontent.com/kubearmor/KubeArmor/main/pkg/KubeArmorOperator/config/samples/sample-config.yml
watch -n 1 '[[ "$(kubectl get po -n kubearmor --no-headers | awk "{ print \$3 }" | grep -v "Running")" == "" && "$(date +%s)" -ge "$((SECONDS+120))" ]] && pkill -f "watch" && echo "All pods are in Running state"'

```{{exec}}

OR

```plain
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
karmor install
watch -n 1 '[[ "$(kubectl get po -n kubearmor --no-headers | awk "{ print \$3 }" | grep -v "Running")" == "" && "$(date +%s)" -ge "$((SECONDS+120))" ]] && pkill -f "watch" && echo "All pods are in Running state"'
```{{exec}}


