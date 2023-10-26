Deploy the Nginx application to test policy enforcement using KubeArmor.

```
kubectl create deployment nginx --image=nginx
kubectl wait --for=condition=ready --timeout=1m -n default pod -l app=nginx
```{{exec}}

