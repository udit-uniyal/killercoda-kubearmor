First we need to install kubeArmor in our kubernetes envirionment

```plain
helm repo add kubearmor https://kubearmor.github.io/charts
helm repo update 
helm upgrade --install kubearmor-operator kubearmor/kubearmor-operator -n kubearmor --create-namespace
kubectl apply -f https://raw.githubusercontent.com/kubearmor/KubeArmor/main/pkg/KubeArmorOperator/config/samples/sample-config.yml
namespace="kubearmor" && duration=120 && (watch -n 1 "kubectl get po -n $namespace" & sleep $duration; while kubectl get po -n $namespace | tail -n +2 | awk '{print $3}' | grep -q -v "Running"; do sleep 15; done; echo "All pods are in the 'Running' state. Exiting..."; pkill -P $$) && exit && clear
```{{exec}}

OR

```plain
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
karmor install
namespace="kubearmor" && duration=120 && (watch -n 1 "kubectl get po -n $namespace" & sleep $duration; while kubectl get po -n $namespace | tail -n +2 | awk '{print $3}' | grep -q -v "Running"; do sleep 15; done; echo "All pods are in the 'Running' state. Exiting..."; pkill -P $$) && exit && clear
```{{exec}}


