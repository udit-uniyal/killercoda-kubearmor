When you execute the command below, it will provide logs under Karmor logs:

```
kubectl exec -it -n default $POD -- cat /etc/nginx/conf.d/default.conf
```{{exec}}

To view the logs, you can use the following command:








