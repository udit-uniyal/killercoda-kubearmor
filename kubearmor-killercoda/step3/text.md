Before enforcing the 'Deny execution of package management tools (apt/apt-get)' policy, we can use the 'apt' command to install any application.

```plain
kubectl exec -it $POD -- bash -c "apt update && apt install masscan"
```{{exec}}
