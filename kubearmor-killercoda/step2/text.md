Deploy the Nginx application to test policy enforcement using KubeArmor.

```
kubectl apply -f https://raw.githubusercontent.com/kubearmor/KubeArmor/main/examples/wordpress-mysql/wordpress-mysql-deployment.yaml
POD=$(kubectl get pod -n wordpress-mysql -l app=dvwa-mysql -o custom-columns=:metadata.name --no-headers)
while [[ -n "$POD" && $(kubectl get pod -n wordpress-mysql "$POD" -o=jsonpath='{.status.phase}') != "Running" ]]; do
  sleep 5
  POD=$(kubectl get pod -n wordpress-mysql -l app=dvwa-mysql -o custom-columns=:metadata.name --no-headers)
done
```{{exec}}
