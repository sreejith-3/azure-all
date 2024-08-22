### This script sets up the Azure CLI and configures access to your AKS cluster.

#!/bin/bash

# Exit on error
set -e

# Variables
ENVIRONMENT=$1
RESOURCE_GROUP='your-resource-group'
CLUSTER_NAME='your-aks-cluster'

# Login to Azure
echo "Logging in to Azure..."
az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID

# Get AKS credentials
echo "Getting AKS credentials for environment: $ENVIRONMENT..."
az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME

echo "Azure CLI setup complete."
