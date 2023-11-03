Lets audit access to /etc/nginx/ folder within the deployment.

```
cat <<EOF | kubectl apply -f -
apiVersion: security.kubearmor.com/v1
kind: KubeArmorPolicy
metadata:
  name: audit-etc-nginx-access
spec:
  selector:
    matchLabels:
      app: nginx
  file:
    matchDirectories:
    - dir: /etc/nginx/
      recursive: true
  action:
    Audit
EOF

```{{exec}}

**Note:** karmor logs -n default would show all the audit/block operations.
