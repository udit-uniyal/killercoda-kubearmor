#!/bin/bash

namespace="kubearmor"
duration=120  # Watch duration in seconds

# Start watching the pods
watch -n 1 "kubectl get po -n $namespace"

# Wait for the specified duration
sleep $duration

# Check if all pods are in the "Running" state
while true; do
  all_running=true
  while read -r line; do
    if [[ ! $line =~ "Running" ]]; then
      all_running=false
      break
    fi
  done < <(kubectl get po -n $namespace | awk 'NR > 1 {print $3}')
  
  if $all_running; then
    echo "All pods are in the 'Running' state. Exiting..."
    break
  else
    echo "Not all pods are in the 'Running' state. Continuing to check..."
    sleep 5  # Check every 5 seconds
  fi
done

