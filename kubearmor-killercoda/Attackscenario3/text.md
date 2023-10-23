Attacker:

Exploits a vulnerability in the Nginx application to gain access to the pod.
Once inside the pod, the attacker attempts to steal sensitive data from the /etc/ssl/ directory.
However, the KubeArmor policy blocks the attacker's attempt to access the /etc/ssl/ directory, as it is only allowed to be accessed in read-only mode.
The attacker then attempts to escalate their privileges by running a malicious process on the pod.
However, the KubeArmor policy also blocks the attacker's attempt to run the malicious process, as it is not included in the list of allowed processes.
