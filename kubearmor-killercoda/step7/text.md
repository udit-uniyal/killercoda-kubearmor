Let's apply the Deny access to service account token policy

```
cat <<EOF | kubectl apply -f -
apiVersion: security.kubearmor.com/v1
kind: KubeArmorPolicy
metadata:
  name: block-service-access-token-access
spec:
  selector:
    matchLabels:
      app: nginx
  file:
    matchDirectories:
    - dir: /run/secrets/kubernetes.io/serviceaccount/
      recursive: true
  action:
    Block
EOF
```{{exec}}

