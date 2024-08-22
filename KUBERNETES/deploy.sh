#!/bin/bash

# Parameters
ENVIRONMENT=$1  # This will automatically receive the value from the pipeline

# Other variables
CHART_NAME="your-chart-name"
NAMESPACE="your-namespace"
RELEASE_NAME="your-release-name"
VALUES_FILE="values-$ENVIRONMENT.yaml"

# Check if the environment is provided
if [ -z "$ENVIRONMENT" ]; then
  echo "Error: No environment specified."
  exit 1
fi

# Deploy the Helm chart to the specified environment
echo "Deploying $CHART_NAME to $ENVIRONMENT environment..."

helm upgrade --install $RELEASE_NAME ./$CHART_NAME \
  --namespace $NAMESPACE \
  -f $VALUES_FILE

if [ $? -ne 0 ]; then
  echo "Deployment to $ENVIRONMENT failed!"
  exit 1
else
  echo "Deployment to $ENVIRONMENT succeeded!"
fi
