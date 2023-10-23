First we need to install kubeArmor in our kubernetes envirionment

```plain
helm repo add kubearmor https://kubearmor.github.io/charts
helm repo update 
helm upgrade --install kubearmor-operator kubearmor/kubearmor-operator -n kubearmor --create-namespace
kubectl apply -f https://raw.githubusercontent.com/kubearmor/KubeArmor/main/pkg/KubeArmorOperator/config/samples/sample-config.yml
timeout 180s watch -n 1 kubectl get po -n kubearmor | awk 'NR > 1 {print $3}' | grep -q -v "Running" || echo "All pods are in the 'Running' state. Exiting..."
```{{exec}}

OR

```plain
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin
karmor install
chmod +x setup.sh && ./setup.sh
```{{exec}}


