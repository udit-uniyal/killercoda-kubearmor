Deploy the Nginx application to test policy enforcement using KubeArmor.

```plain
kubectl create deployment nginx --image=nginx
POD=$(kubectl get pod -l app=nginx -o name)
while [[ $(kubectl get $POD -o=jsonpath='{.status.phase}') != "Running" ]]; do
  sleep 5  
done

```{{exec}}
