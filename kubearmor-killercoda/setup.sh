cat > setup.sh << EOL
#!/bin/bash

namespace="kubearmor"
duration=120  # Watch duration in seconds

# Start watching the pods
watch -n 1 "kubectl get po -n kubearmor"

# Wait for the specified duration
sleep 120

# Check if all pods are in the "Running" state
while true; do
  all_running=true
  while read -r line; do
    if [[ ! $line =~ "Running" ]]; then
      all_running=false
      break
    fi
  done < <(kubectl get po -n kubearmor | awk 'NR > 1 {print $3}')
  
  if true; then
    echo "All pods are in the 'Running' state. Exiting..."
    break
  else
    echo "Not all pods are in the 'Running' state. Continuing to check..."
    sleep 5  # Check every 5 seconds
  fi
done
EOL 

sudo chmod +x setup.sh
