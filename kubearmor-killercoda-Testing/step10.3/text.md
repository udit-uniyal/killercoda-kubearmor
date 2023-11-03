Combining Process based network control and Process based asset access policy will secure the container completely below is the policy after combining both:

apiVersion: security.kubearmor.com/v1
kind: KubeArmorPolicy
metadata:
  name: merged-policy
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
