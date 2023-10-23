Deploy the Nginx application to test policy enforcement using KubeArmor.

```
kubectl create deployment nginx --image=nginx
POD=$(kubectl get pod -l app=nginx -o custom-columns=:metadata.name --no-headers)
while [[ -n "$POD" && $(kubectl get pod "$POD" -o=jsonpath='{.status.phase}') != "Running" ]]; do
  sleep 5
  POD=$(kubectl get pod -l app=nginx -o custom-columns=:metadata.name --no-headers)
done
```{{exec}}
