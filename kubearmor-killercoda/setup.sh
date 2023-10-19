curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin && karmor install && kubectl create deployment nginx --image=nginx && POD=$(kubectl get pod -l app=nginx -o name) && cat <<EOF | kubectl apply -f -
apiVersion: security.kubearmor.com/v1
kind: KubeArmorPolicy
metadata:
  name: block-pkg-mgmt-tools-exec
spec:
  selector:
    matchLabels:
      app: nginx
  process:
    matchPaths:
    - path: /usr/bin/apt
    - path: /usr/bin/apt-get
  action:
    Block
EOF

