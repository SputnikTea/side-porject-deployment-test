#!/bin/zsh

export RANDOM_ID="$(openssl rand -hex 3)"
export MY_RESOURCE_GROUP_NAME="deploy-side-project-test"
export REGION=westeurope
export MY_STATIC_WEB_APP_NAME="deployStaticWebAppTest"

#az login

az group create \
  --name $MY_RESOURCE_GROUP_NAME \
  --location $REGION \
  --query "properties.provisioningState"


az staticwebapp create \
    --name $MY_STATIC_WEB_APP_NAME \
    --resource-group $MY_RESOURCE_GROUP_NAME \
    --location $REGION \
    --query "defaultHostname"

npx swa login \
  --resource-group $MY_RESOURCE_GROUP_NAME \
   --app-name $MY_STATIC_WEB_APP_NAME \

npx swa deploy --env production
