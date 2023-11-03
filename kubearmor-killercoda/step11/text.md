
When executing `kubectl exec -it $POD -- bash -c "chroot"`{{exec}} on a KubeArmor-protected pod, the policy blocks the command, triggering an audit log.
