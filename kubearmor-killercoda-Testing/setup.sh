#!/bin/bash
namespace="kubearmor"
duration=120
watch -n 1 "kubectl get po -n $namespace" &
watch_pid=$!
kubectl wait --for=condition=ready --timeout=$duration -n kubearmor pod -l kubearmor-app
kill $watch_pid
echo "All pods are in the 'Running' state. Exiting..."













