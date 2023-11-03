By default the security posture is set to audit. Lets change the security posture to default deny.

`kubectl annotate ns default kubearmor-file-posture=block --overwrite`{{exec}}
