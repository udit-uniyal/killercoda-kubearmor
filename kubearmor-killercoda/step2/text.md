Deploy the Nginx application to test policy enforcement using Kubearmor.

```plain
kubectl create deployment nginx --image=nginx
POD=$(kubectl get pod -l app=nginx -o name)
```{{exec}}
