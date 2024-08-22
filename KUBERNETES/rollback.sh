#!/bin/bash

# Exit on error
set -e

# Variables
HELM_RELEASE_NAME="my-release"
KUBE_CONTEXT="your-kube-context"  # Your Kubernetes context

# Check if revision argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <revision>"
  exit 1
fi

REVISION=$1

echo "Rolling back to revision: $REVISION"

# Set Kubernetes context
kubectl config use-context $KUBE_CONTEXT

# Rollback Helm release
helm rollback $HELM_RELEASE_NAME $REVISION

echo "Rollback completed to revision: $REVISION"
