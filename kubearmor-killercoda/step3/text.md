Deny execution of package management tools (apt/apt-get)
Package management tools can be used in the runtime env to download new binaries that will increase the attack surface of the pods. Attackers use package management tools to download accessory tooling (such as masscan) to further their cause. It is better to block usage of package management tools in production environments.

Lets apply the policy to block such execution:

kubectl apply -f Deny-execution-of-package-management-tool.yaml
```{{exec}}
