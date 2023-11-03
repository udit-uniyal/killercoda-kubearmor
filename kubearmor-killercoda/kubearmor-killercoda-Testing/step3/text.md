Using the below command, an attacker installs a powerful network scanning tool. This allows the attacker to identify vulnerabilities, open ports, and potential attack vectors on the target network

```plain
kubectl exec -it $POD -- bash -c "apt update && apt install masscan"
```{{exec}}



