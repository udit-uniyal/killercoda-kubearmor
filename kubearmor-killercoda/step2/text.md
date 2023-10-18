#### Deploy test nginx app 

```plain
kubectl create deployment nginx --image=nginx
POD=$(kubectl get pod -l app=nginx -o name)
```{{exec}}
