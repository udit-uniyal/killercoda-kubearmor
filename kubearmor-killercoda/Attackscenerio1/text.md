### Attacking Perspective:

Objective: To install 'masscan' on a target system for network reconnaissance.

Vulnerability Identification: Identifying the absence of a 'Deny execution of package management tools' policy.

Exploitation: Using 'kubectl' to execute 'apt update' and 'apt install masscan' commands on the target system.

Unauthorized Installation: Successfully installs 'masscan' on the target system, providing the attacker with network scanning capabilities.

Potential Risks: The attacker can now conduct network scans, identifying vulnerabilities and potential attack vectors on the target network.

### Defensive Perspective:

Objective: To defend against an unauthorized software installation on a target system.

Vulnerability Identification: Recognizing the absence of the 'Deny execution of package management tools' policy, which allows the execution of 'apt' commands for software installation.

Mitigation: Implementing and enforcing the 'Deny execution of package management tools (apt/apt-get)' KubeArmor policy to block the execution of such commands.

Prevention: By enforcing the policy, the organization effectively prevents the attacker from using 'apt' to install unauthorized software like 'masscan.'

Security Enhancement: With the policy in place, the organization enhances its security posture, reducing the risk of unauthorized software installations and potential network scanning activities.




