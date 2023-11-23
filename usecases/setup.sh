cat > setup.sh << 'EOL'
#!/bin/bash
namespace="kubearmor"
duration=120
watch -n 1 "kubectl get po -n $namespace" &
watch_pid=$!
sleep $duration
while kubectl get po -n $namespace | tail -n +2 | awk '{print $3}' | grep -q -v "Running"; do
  sleep 8
done
kill $watch_pid
echo "All pods are in the 'Running' state. Exiting..."
EOL













