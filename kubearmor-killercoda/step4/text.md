

Lets apply the policy to block such execution:


<a href="javascript:void(0);" onclick="executePolicy()">Apply Policy</a>

<script>
function executePolicy() {
  var codeBlock = `
  cat <<EOF | kubectl apply -f -
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
  `;
  var pre = document.createElement("pre");
  pre.textContent = codeBlock;
  document.body.appendChild(pre);
}
</script>




