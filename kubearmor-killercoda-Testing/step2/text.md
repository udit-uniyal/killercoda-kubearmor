Deploy the Nginx application to test policy enforcement using KubeArmor.

```
kubectl create deployment nginx --image=nginx
sleep 5
kubectl wait --for=condition=ready --timeout=1m -n default pod -l app=nginx
export POD=$(kubectl get pod -l app=nginx -o --no-headers)
```{{exec}}

