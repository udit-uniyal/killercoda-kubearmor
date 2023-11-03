The attacker employs various attack techniques to modify configuration files. The following KubeArmor policy restricts unauthorized processes from accessing the configuration files.

```
cat <<EOF | kubectl apply -f -
apiVersion: security.kubearmor.com/v1
kind: KubeArmorPolicy
metadata:
  name: process-based-asset-accessleast-permissive-policy
  namespace: default
spec:
  selector:
    matchLabels:
      app: nginx
  file:
    matchDirectories:
    - dir: /
      recursive: true
    - dir: /etc/nginx/
      recursive: true
      fromSource:
      - path: /usr/sbin/nginx
    - dir: /etc/nginx/
      recursive: true
      fromSource:
      - path: /usr/bin/cd
    - dir: /etc/nginx/
      recursive: true
      readOnly: true
      action: Block
  process:
    matchPaths:
    - path: /usr/sbin/nginx
    - path: /usr/bin/bash
  message: process-based-asset-access
  action: Allow
EOF
```{{exec}}

By default the security posture is set to audit. Lets change the security posture to default deny.

`kubectl annotate ns default kubearmor-file-posture=block --overwrite`{{exec}}
