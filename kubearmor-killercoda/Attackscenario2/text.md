In a Kubernetes environment, service account tokens are present in every pod, even if they are not directly used by the application running in the pod. This can potentially create security vulnerabilities that attackers might exploit:

**Accessing a Compromised Pod:** An attacker gains access to a compromised pod within the Kubernetes cluster.

**Fetching the Service Account Token:** Once inside the compromised pod, the attacker retrieves the service account token. This token is used for authenticating with the Kubernetes API server. The attacker can use the token to communicate with the cluster's control plane and potentially manipulate the cluster.

**Unauthorized Access to Kubernetes API:** With the service account token, the attacker can make requests to the Kubernetes API server. This unauthorized access may lead to a range of actions, including extracting sensitive information, manipulating resources, or compromising the cluster's security.
