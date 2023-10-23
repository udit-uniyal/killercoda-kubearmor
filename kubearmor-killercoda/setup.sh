cat > setup.sh << EOL
#!/bin/bash

namespace="kubearmor"
duration=256  # Watch duration in seconds

# Start watching the pods in the background
watch -n 1 "kubectl get po -n kubearmor" &
watch_pid=$!

# Wait for the specified duration
sleep 256

# Check if all pods are in the "Running" state
while true; do
  if kubectl get po -n kubearmor | awk 'NR > 1 {print $3}' | grep -q -v "Running"; then
    echo "Not all pods are in the 'Running' state. Continuing to check..."
    sleep 15  # Check every 5 seconds
  else
    echo "All pods are in the 'Running' state. Exiting..."
    break
  fi
done

# Terminate the watch process
kill $watch_pid

EOL 


