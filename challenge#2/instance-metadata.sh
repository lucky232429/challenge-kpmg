#!/bin/bash

tenant_id="f474fe30-ebaa-49a6-bdfc-364e3781f6d9"
client_id="f1e40223-1ccc-4b46-a9a1-8dcf6c1e3810"
client_secret="M6c8Q~hyBYknB2fPjg~lQ7dsTFzonwrptIbw1atU"
subscription_id="a658f949-766b-42b6-a1f3-d9f6c9800b84"

az login --service-principal --tenant "$tenant_id" --username "$client_id" --password "$client_secret"

az account set --subscription "$subscription_id"

az ad signed-in-user show

#!/bin/bash

# Define the data key
data_key=$1

# Retrieve metadata
metadata=$(curl -s -H "Metadata: true" "http://169.254.169.254/metadata/instance?api-version=2021-09-01")

# Check if the data key exists in metadata
if [[ $(echo "$metadata" | jq -e ".$data_key") == "null" ]]; then
  echo "Error: Data key not found in metadata."
  exit 1
fi

# Extract the value of the data key
data_value=$(echo "$metadata" | jq -r ".$data_key")

# Create a JSON object with the data key and value
json_output=$(jq -n --arg key "$data_key" --arg value "$data_value" '{"key": $key, "value": $value}')

# Print the JSON output
echo "$json_output"

