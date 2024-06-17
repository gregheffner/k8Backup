#!/bin/bash

# Get the current date in the format MMDDYYYY
current_date=$(date +%m%d%Y)

# List of all resource types
resources=(
  "configmaps"
  "daemonsets"
  "deployments"
  "endpoints"
  "events"
  "horizontalpodautoscalers"
  "ingresses"
  "jobs"
  "limitranges"
  "namespaces"
  "nodes"
  "persistentvolumeclaims"
  "persistentvolumes"
  "pods"
  "podsecuritypolicies"
  "podtemplates"
  "replicasets"
  "replicationcontrollers"
  "resourcequotas"
  "secrets"
  "serviceaccounts"
  "services"
  "statefulsets"
)

# Create the backup directory if it doesn't exist
mkdir -p "Backups/K8FileBackup-${current_date}"

# Loop over all resource types and export them to a file
for resource in "${resources[@]}"; do
  kubectl get "$resource" --all-namespaces -o yaml > "Backups/K8FileBackup-${current_date}/${resource}.yaml" || continue
done
