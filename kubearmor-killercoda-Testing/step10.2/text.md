Delete all policies to test the Network based least permissive policy:

`kubectl delete ksp --all`{{exec}}

Attacker binaries can communicate with their C&C servers and exfiltrate data using a variety of network primitives. To protect your Kubernetes cluster let's apply below policy:

```
cat <<EOF | kubectl apply -f -
apiVersion: security.kubearmor.com/v1
kind: KubeArmorPolicy
metadata:
  name: network-based-least-permissive-policy
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

```
kubectl annotate ns default kubearmor-network-posture=block --overwrite
```{{exec}}


Policy blocks the below operation:

```
kubectl exec -it $POD -- bash -c 'curl www.google.com && exit'
```{{exec}}
