#!/bin/bash

# Exit on error
set -e

# Variables
IMAGE=$1
REGISTRY_NAME='your-acr-name'
AKS_CLUSTER_NAME='your-aks-cluster'
RESOURCE_GROUP='your-resource-group'

# Login to Azure
echo "Logging in to Azure..."
az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID

# Get AKS credentials
echo "Getting AKS credentials..."
az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME

# Deploy the Docker image to AKS
echo "Deploying image to AKS..."
kubectl set image deployment/your-deployment-name your-container-name=$IMAGE --record

# Optional: Verify deployment
echo "Verifying deployment..."
kubectl rollout status deployment/your-deployment-name

echo "Deployment completed successfully!"
