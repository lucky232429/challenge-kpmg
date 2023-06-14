# challenge-kpmg


Challenge#1:
 1. Install below tools to complete the cahllenge
    a. Terraform
    b. Azure CLI
    c. VS Code
    d. git
 2. Login to azure cloud using az login command

Note: Above first 2 steps are if we are working from our local laptop.

If we want to execute azure devops pipelines follow below steps.
 3. Create Azure Storage Account manually along with container init.
 4. Create service principal using the bwlow command.
    $az ad sp create-for-rbac --name {principalname} --role {role|Contributor} --scopes {scope|/subscriptions/{subscription}/resourceGroups/{resourcegroup}}
 5. Create azure azure key vault and provide contributor access to service principal.
 6. Place service principal clinetid, clientsecret, tenantid, subscriptionid and azure activ directory user group object id in it.
 7. Create variable group in ado and integrate with azure keyvault and access required secrets from azure key vault.
 8. Create arm service connection in azure devops.

Challenge#2:
Azure VM Instance Metadat
*************************
https://learn.microsoft.com/en-us/azure/virtual-machines/instance-metadata-service?tabs=linux


