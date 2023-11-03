Combining process-based network control and process-based asset access policies will completely secure the container. Below is the merged policy:

```
cat <<EOF | kubectl apply -f -
apiVersion: security.kubearmor.com/v1
kind: KubeArmorPolicy
metadata:
  name: least-permissive-policy
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
  network:
    matchProtocols:
    - protocol: tcp
      fromSource:
      - path: /usr/bin/wget
    - protocol: udp
      fromSource:
      - path: /usr/bin/wget
  process:
    matchPaths:
    - path: /usr/sbin/nginx
    - path: /usr/bin/bash
  message: process-based-asset-access
  action: Allow
EOF
```{{exec}}
