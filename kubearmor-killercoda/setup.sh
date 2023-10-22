cat > setup.sh << EOL
#!/bin/bash

namespace="kubearmor"
duration=120  # Watch duration in seconds

# Start watching the pods in the background
watch -n 1 "kubectl get po -n $namespace" &
watch_pid=$!

# Wait for the specified duration
sleep $duration

# Check if all pods are in the "Running" state
while true; do
  if kubectl get po -n $namespace | awk 'NR > 1 {print $3}' | grep -q -v "Running"; then
    echo "Not all pods are in the 'Running' state. Continuing to check..."
    sleep 5  # Check every 5 seconds
  else
    echo "All pods are in the 'Running' state. Exiting..."
    break
  fi
done

# Terminate the watch process
kill $watch_pid
e
EOL 


