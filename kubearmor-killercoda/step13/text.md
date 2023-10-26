Suppose an attacker tries to access the /etc/nginx/conf.d/default.conf file in a number of ways, depending on the vulnerabilities present in the server and the attacker's level of expertise. If the attacker gains access to the default.conf file, you can view the logs using:

karmor logs -n default

Full Attack Simulation:

The provided tmux commands create a split terminal for security assessment: monitoring Kubernetes logs in one pane and extracting configuration files from a pod in another, which is under audit policy.

```
tmux new-session -d -s mySession
tmux split-window -h -t mySession
tmux send-keys -t mySession.0 'karmor logs -n default' C-m
tmux send-keys -t mySession.1 'pod_name=$(kubectl get pod -n default -o custom-columns=:metadata.name --no-headers | head -n 1); kubectl exec -it -n default $pod_name -- cat /etc/nginx/conf.d/default.conf' C-m
tmux attach-session -t mySession
```{{exec}}
`exit`{{exec}}
