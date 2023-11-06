**Attacker**: Installs 'masscan' on a target system for network scan. Utilize 'kubectl' to execute 'apt update' and 'apt install masscan' commands, successfully installing 'masscan' and gaining network scanning capabilities. 

**Defender**: 'Deny execution of package management tools (apt/apt-get)' KubeArmor policy is enforced, preventing unauthorized software installations, enhancing security, and reducing the risk of network scanning activities.




