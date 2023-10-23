Deploy the Nginx application to test policy enforcement using KubeArmor.

```
kubectl create deployment nginx --image=nginx
POD=$(kubectl get pod -l app=nginx -o jsonpath='{.items[0].metadata.name}')
while [[ $(kubectl get pod "$POD" -o=jsonpath='{.status.phase}') != "Running" ]]; do
  sleep 5
done
```{{exec}}
