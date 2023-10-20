**Effect of the Policy:**With the policy in place, if anyone tries to access a service account token within a pod, they will encounter a "Permission Denied" error. This hinders unauthorized access.

`kubectl exec -it $POD -- bash`{{exec}}
`curl https://$KUBERNETES_PORT_443_TCP_ADDR/api --insecure --header "Authorization: Bearer $(cat /run/secrets/kubernetes.io/serviceaccount/token)"`{{exec}}
