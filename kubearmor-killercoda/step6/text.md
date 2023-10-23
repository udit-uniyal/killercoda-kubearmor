**Accessing Service Account Token:** An attacker, who has gained access to a compromised pod, can access the service account token. They might execute a command like this:

`kubectl exec -it $POD -- bash`{{exec}}

**Fetching the Service Account Token:** Once inside the compromised pod, the attacker can retrieve the service account token using a command like this:

`curl https://$KUBERNETES_PORT_443_TCP_ADDR/api --insecure --header "Authorization: Bearer $(cat /run/secrets/kubernetes.io/serviceaccount/token)" && exit`{{exec}}

This command fetches the service account token, which is used for authenticating with the Kubernetes API server.

**Unauthorized Access to Kubernetes API Server:** With the service account token in hand, the attacker can access the Kubernetes API server. They can make requests to the API server, potentially leading to unauthorized control over the cluster or extracting sensitive information.Unauthorized Access to Kubernetes API Server: With the service account token in hand, the attacker can access the Kubernetes API server. They can make requests to the API server, potentially leading to unauthorized control over the cluster or extracting sensitive information.

