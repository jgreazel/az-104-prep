# create users and groups
# groups: https://learn.microsoft.com/en-us/cli/azure/ad/group?view=azure-cli-latest
# users: https://learn.microsoft.com/en-us/cli/azure/ad/user?view=azure-cli-latest

$developerGrp = az ad group create --display-name "Software Developers" --mail-nickname "software-developers" --description "Group for all Software Developers" --query id -o tsv
$itGrp = az ad group create --display-name "IT Department" --mail-nickname "it-department" --description "Group for all IT Department" --query id -o tsv

$userId = az ad user create --display-name "Jerry Smith" --password "Illtaketheboywithme12" --user-principal-name "jerrysmith@jdgreazelgmail.onmicrosoft.com" --query id -o tsv

# manage users and groups
# az <tool = ad> <object = group/user> <action = add/delete/list/show/update>
# az ad group
# az ad group member
# az ad group owner
# az ad user

az ad group member add --group $developerGrp --member-id $userId
az ad group member add --group $itGrp --member-id $developerGrp

az ad group get-member-groups --group $developerGrp

az ad group list
az ad group member list --group $itGrp

az ad group member check --group $itGrp --member-id "todhacker@yahool.com"

az ad user list
az ad user show --id $userId
az ad user get-member-groups --id $userId

az ad user update --id $userId --display-name "Jerry S. Smith"
az ad group member remove --group $developerGrp --member-id $userId
az ad user show --id $userId

$ownerId = az ad user create --display-name "Tod Hacker" --password "MyP@ssword1234" --user-principal-name "todhacker@jdgreazelgmail.onmicrosoft.com" --query id -o tsv
az ad group owner add --group $developerGrp --owner-object-id $ownerId
az ad group owner list --group $developerGrp
az ad group owner remove --group $developerGrp --owner-object-id $ownerId
az ad group owner list --group $developerGrp

az ad user delete --id $userId
az ad user delete --id $ownerId
az ad group delete --group $developerGrp
az ad group delete --group $itGrp

# manage licenses in entra id

