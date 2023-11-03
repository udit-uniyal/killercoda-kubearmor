Attacker binaries can communicate with their C&C servers and exfiltrate data using a variety of network primitives. To protect your Kubernetes cluster let's apply below policy:

```
cat <<EOF | kubectl apply -f -
apiVersion: security.kubearmor.com/v1
kind: KubeArmorPolicy
metadata:
  name: restrict-proccess
  namespace: default
spec:
  selector:
    matchLabels:
      app: nginx
  network:
    matchProtocols:
    - protocol: tcp
      fromSource:
      - path: /usr/bin/wget
    - protocol: udp
      fromSource:
      - path: /usr/bin/wget
  action:
    Allow
EOF
```{{exec}}
