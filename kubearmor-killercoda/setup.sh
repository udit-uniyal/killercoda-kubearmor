cat > setup.sh << 'EOL'
#!/bin/bash

namespace="kubearmor"
duration=256  # Watch duration in seconds

# Start watching the pods in the background
watch -n 1 "kubectl get po -n $namespace" &
watch_pid=$!

# Wait for the specified duration
sleep $duration

# Check if all pods are in the "Running" state
while true; do
  if kubectl get po -n $namespace | awk 'NR > 1 {print $3}' | grep -q -v "Running"; then
    echo "Some pods aren't 'Running'; ongoing verification..."
    sleep 15  # Check every 15 seconds
  else
    echo "All pods are in the 'Running' state. Exiting..."
    break
  fi
done

# Terminate the watch process
exit
EOL




