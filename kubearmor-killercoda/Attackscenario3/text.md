### Scenario from the Attacker's Perspective:

The attacker has exploited a vulnerability in the Nginx application to gain access to the pod. Once inside the pod, the attacker wants to steal sensitive data from the /etc/ssl/ directory. However, the attacker realizes that the KubeArmor policy blocks access to this directory in read-only mode.

The attacker then tries to escalate their privileges by running a malicious process on the pod. However, the KubeArmor policy also blocks the attacker's attempt to run the malicious process, as it is not included in the list of allowed processes.

The attacker is now frustrated because they cannot achieve their objectives. They could try to find another way to exploit the Nginx application, or they could try to attack another pod that is not protected by KubeArmor.


### Scenario from the Defender's Perspective:

The defender is happy to see that the KubeArmor policy has successfully prevented the attacker from stealing sensitive data and escalating their privileges on the pod. This is because the defender has implemented a least permissive policy, which only allows the Nginx process to access the resources that it needs.

The defender knows that the attacker may try to find another way to exploit the Nginx application, or they may try to attack another pod that is not protected by KubeArmor. Therefore, the defender continues to monitor the environment for suspicious activity and makes sure that all of their pods are protected by KubeArmor.

By implementing least permissive policies and monitoring the environment for suspicious activity, defenders can significantly reduce their risk of being compromised.
