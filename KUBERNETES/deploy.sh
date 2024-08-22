#!/bin/bash

# Exit on error
set -e

# Variables
HELM_RELEASE_NAME="my-release"
HELM_CHART_DIR="./charts/app"  # Path to the Helm chart directory
KUBE_CONTEXT="your-kube-context"  # Your Kubernetes context
ENVIRONMENT="${1:-dev}"  # Default to 'dev' if no argument is provided
VALUES_FILE="values-$ENVIRONMENT.yaml"

# Check if environment argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <environment>"
  exit 1
fi

echo "Deploying to environment: $ENVIRONMENT"

# Set Kubernetes context
kubectl config use-context $KUBE_CONTEXT

# Deploy Helm chart
helm upgrade --install $HELM_RELEASE_NAME $HELM_CHART_DIR \
  --values "$HELM_CHART_DIR/values.yaml" \
  --values "$HELM_CHART_DIR/$VALUES_FILE"

echo "Deployment completed for environment: $ENVIRONMENT"
