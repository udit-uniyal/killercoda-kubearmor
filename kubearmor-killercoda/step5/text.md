KubeArmor enhances security with a 'Deny execution of package management tools' policy. It blocks unauthorized 'apt' usage, stopping the attacker's 'masscan' installation attempt. To view logs, go to the KubeArmor logs tab.

```plain
kubectl exec -it $POD -- bash -c "apt update && apt install masscan"
```{{exec}}

