#!/bin/bash

TEAM=$1
ENVIRONEMT=$2
LOCATION=$3

RESOURCE_GROUP_NAME="rg-$TEAM-$ENVIRONEMT"
STORAGE_ACCOUNT_NAME="st${TEAM}${ENVIRONEMT}tfstate"

STORAGE_ACCOUNT_CONTAINER_NAME="tfstate"

# #Create environment resource group
create_resource_group(){
    if [[ $(az group list --query "[?name=='$RESOURCE_GROUP_NAME'] | length(@)") > 0 ]]; then
        echo "resource group $RESOURCE_GROUP_NAME already exists"
    else
        echo "Creating resource group $RESOURCE_GROUP_NAME ..."
        az group create -n "$RESOURCE_GROUP_NAME" -l $LOCATION
    fi
}

#Create terraform backend storage account
create_storage_account(){
    if [[ $(az storage account list -g "$RESOURCE_GROUP_NAME" --query "[?name=='$STORAGE_ACCOUNT_NAME'] | length(@)") > 0 ]]; then
        echo "storage account $STORAGE_ACCOUNT_NAME already exists"
    else
        echo "Creating storage account $STORAGE_ACCOUNT_NAME ..."
        az storage account create -n $STORAGE_ACCOUNT_NAME -l $LOCATION -g "$RESOURCE_GROUP_NAME" --kind "StorageV2" --sku "Standard_LRS" --encryption-services "blob"
    fi
}

# Create blob containers for each resource type in this environment
create_storage_container(){
    STORAGE_ACCOUNT_CONNECTION_STRING=$(az storage account show-connection-string -g $RESOURCE_GROUP_NAME -n $STORAGE_ACCOUNT_NAME -o tsv)
    if [[ $(az storage container list --account-name "$STORAGE_ACCOUNT_NAME" --connection-string $STORAGE_ACCOUNT_CONNECTION_STRING --query "[?name=='$STORAGE_ACCOUNT_CONTAINER_NAME'] | length(@)") > 0 ]]; then
        echo "storage container $STORAGE_ACCOUNT_CONTAINER_NAME already exists"
    else
        echo "Creating storage container $STORAGE_ACCOUNT_CONTAINER_NAME ..."
        az storage container create --name $STORAGE_ACCOUNT_CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --connection-string $STORAGE_ACCOUNT_CONNECTION_STRING
    fi
}

create_terraform_backend(){
    STORAGE_ACCOUNT_CONNECTION_STRING=$(az storage account show-connection-string -g $RESOURCE_GROUP_NAME -n $STORAGE_ACCOUNT_NAME -o tsv)
    for DIRECTORY in ../terraform/*; do
        if [ -d "${DIRECTORY}" ]; then
            BASENAME=$(basename $DIRECTORY)
            if [[ $(az storage container list --account-name "$STORAGE_ACCOUNT_NAME" --connection-string $STORAGE_ACCOUNT_CONNECTION_STRING --query "[?name=='$BASENAME'] | length(@)") > 0 ]]; then
                echo "Storage container $BASENAME already exists"
                pushd $DIRECTORY/$ENVIRONEMT
                ./backend.tf.heredoc.sh $RESOURCE_GROUP_NAME $STORAGE_ACCOUNT_NAME $BASENAME
                popd                
            else
                echo "Creating storage container $BASENAME ..."
                az storage container create --name $BASENAME --account-name $STORAGE_ACCOUNT_NAME --connection-string $STORAGE_ACCOUNT_CONNECTION_STRING
                pushd $DIRECTORY/$ENVIRONEMT
                ./backend.tf.heredoc.sh $RESOURCE_GROUP_NAME $STORAGE_ACCOUNT_NAME $BASENAME
                popd  
            fi
        fi
    done
}

create_resource_group
create_storage_account
create_terraform_backend
