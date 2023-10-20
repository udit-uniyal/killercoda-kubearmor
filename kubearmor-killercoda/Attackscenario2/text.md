### Scenario from the Attacker's Perspective:

In a Kubernetes environment, service account tokens are present in every pod, even if they are not directly used by the application running in the pod. This can potentially create security vulnerabilities that attackers might exploit:

**Accessing a Compromised Pod:** An attacker gains access to a compromised pod within the Kubernetes cluster.

**Fetching the Service Account Token:** Once inside the compromised pod, the attacker retrieves the service account token. This token is used for authenticating with the Kubernetes API server. The attacker can use the token to communicate with the cluster's control plane and potentially manipulate the cluster.

**Unauthorized Access to Kubernetes API:** With the service account token, the attacker can make requests to the Kubernetes API server. This unauthorized access may lead to a range of actions, including extracting sensitive information, manipulating resources, or compromising the cluster's security.

### Scenario from the Defender's Perspective:

To mitigate the risks associated with unauthorized access to service account tokens, defenders can take the following actions:

**Blocking Access to Service Account Tokens:** A defender creates and applies a security policy to block access to service account tokens. This policy specifies that access to directories where service account tokens are stored should be denied.

**Policy Enforcement:** With the security policy in place, any attempt to access a service account token within a pod is blocked. This means that unauthorized parties, including attackers, are prevented from retrieving the tokens and making unauthorized requests to the Kubernetes API server.

The application of the security policy enhances the overall security of the Kubernetes cluster by ensuring that only authorized entities can access and use service account tokens. This helps protect against unauthorized actions and potential security breaches.
