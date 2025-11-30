# create users and groups
# groups: https://learn.microsoft.com/en-us/cli/azure/ad/group?view=azure-cli-latest
# users: https://learn.microsoft.com/en-us/cli/azure/ad/user?view=azure-cli-latest

$userId = az ad user create --display-name "Obi-Wan Kenobi" --password "Illtaketheboywithme12" --user-principal-name "obiwankenobi@jdgreazelgmail.onmicrosoft.com" --query id -o tsv
$mastersGroupId = az ad group create --display-name "Jedi Masters" --mail-nickname "jedi-masters" --description "Group for all Jedi Masters" --query id -o tsv
$jediGroupId = az ad group create --display-name "Jedi Knights" --mail-nickname "jedi-knights" --description "Group for all Jedi Knights" --query id -o tsv

# manage users and groups
# az <tool = ad> <object = group/user> <action = add/delete/list/show/update>
# az ad group
# az ad group member
# az ad group owner
# az ad user

az ad group member add --group $mastersGroupId --member-id $userId
az ad group member add --group $jediGroupId --member-id $userId
az ad group member add --group $jediGroupId --member-id $mastersGroupId

az ad group list
az ad group member list --group $jediGroupId

az ad user list
az ad user show --id $userId

az ad user delete --id $userId
az ad group delete --group $mastersGroupId
az ad group delete --group $jediGroupId