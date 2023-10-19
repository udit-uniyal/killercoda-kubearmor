Before Policy Enforcement:

**Objective:** The attacker's goal is to install and utilize 'masscan,' a network scanning tool, on a target system.

**Vulnerability Identification:** The attacker identifies that the organization has not yet enforced the 'Deny execution of package management tools (apt/apt-get)' policy, making it possible to use the 'apt' command for software installation.

**Exploitation:** The attacker leverages this vulnerability by executing the following command on the target system using 'kubectl':

```plain
kubectl exec -it $POD -- bash -c "apt update && apt install masscan"
```{{exec}}
```
**Unauthorized Installation:** 'masscan' is successfully installed on the target system, providing the attacker with a powerful network scanning tool.

**Potential Risks:** With 'masscan' at their disposal, the attacker can conduct extensive network scans, potentially identifying vulnerabilities, open ports, and potential attack vectors on the target network.
