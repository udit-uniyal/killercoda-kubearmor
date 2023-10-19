

Lets apply the policy to block such execution:

[Apply Policy](bash -c "cat <<EOF | kubectl apply -f -\napiVersion: security.kubearmor.com/v1\nkind: KubeArmorPolicy\nmetadata:\n  name: block-pkg-mgmt-tools-exec\nspec:\n  selector:\n    matchLabels:\n      app: nginx\n  process:\n    matchPaths:\n    - path: /usr/bin/apt\n    - path: /usr/bin/apt-get\n  action:\n    Block\nEOF")



