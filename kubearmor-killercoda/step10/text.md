File policy:
```
cat <<EOF | kubectl apply -f -
apiVersion: security.kubearmor.com/v1
kind: KubeArmorPolicy
metadata:
  name: nginx-file-policy
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
      action: Block
      message: "access attempted to /etc/nginx/ outside of whitelisted processes"
    - dir: /etc/ssl/
      recursive: true
      readOnly: true
      action: Block
      message: "only allow readonly access of cert folder to all process
EOF
```{{exec}}

