After the enforcement of the 'Deny execution of package management tools (apt/apt-get)' policy, we cannot use the 'apt' command to install any application.

```plain
kubectl exec -it $POD -- bash -c "apt update && apt install masscan"
```{{exec}}
