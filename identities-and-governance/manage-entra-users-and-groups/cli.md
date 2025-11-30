# Manage Microsoft Entra users and groups

## Create users and groups

### Create user

- https://learn.microsoft.com/en-us/cli/azure/ad/user?view=azure-cli-latest

```bash
az ad user create --display-name
                  --password
                  --user-principal-name
                  [--force-change-password-next-sign-in {false, true}]
                  [--immutable-id]
                  [--mail-nickname]

```

```bash
az ad user create --display-name cliTestUser --password password --user-principal-name cliTestUser@defaultdomain.com
```

### Create group

- https://learn.microsoft.com/en-us/cli/azure/ad/group?view=azure-cli-latest

```bash
az ad group create --display-name
                   --mail-nickname
                   [--description]
                   [--force {false, true}]
```

```bash
az ad group create --display-name cliGroup --mail-nickname cliGroup
```

## Manage user and group properties

### List users

```bash
az ad user list [--display-name]
                [--filter]
                [--upn]
```

### show user details

```bash
az ad user show --id
```

### get user's groups

```bash
az ad user get-member-groups --id
                             [--security-enabled-only {false, true}]
```

### update user

```bash
az ad user update --id
                  [--account-enabled {false, true}]
                  [--display-name]
                  [--force-change-password-next-sign-in {false, true}]
                  [--mail-nickname]
                  [--password]
```

### delete user

```bash
az ad user delete --id
```
