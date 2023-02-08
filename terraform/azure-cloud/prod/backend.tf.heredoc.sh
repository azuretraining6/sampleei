CURRENT_DIRECTORY=$(pwd)
RESOURCE_GROUP_NAME=$1
STORAGE_ACCOUNT_NAME=$2
STORAGE_ACCOUNT_CONTAINER_NAME=$3
bash -c "cat > $CURRENT_DIRECTORY/backend.tf" <<EOT
resource_group_name  = "$RESOURCE_GROUP_NAME"
storage_account_name = "$STORAGE_ACCOUNT_NAME"
container_name       = "$STORAGE_ACCOUNT_CONTAINER_NAME"
key                  = "terraform.tfstate"
EOT