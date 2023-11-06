Deploy the Nginx application to test policy enforcement using KubeArmor.

```
kubectl create deployment nginx --image=nginx
sleep 20
kubectl wait --for=condition=ready --timeout=1m -n default pod -l app=nginx
POD=$(kubectl get pod -l app=nginx -o custom-columns=:metadata.name --no-headers)
```{{exec}}

