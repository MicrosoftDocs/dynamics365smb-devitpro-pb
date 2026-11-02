---
title: Manage Business Central Self-Service Signups
ms.date: 10/29/2026
ms.topic: how-to
author: jswymer
description: Learn how to allow or block Business Central self-service signups and check the setting for your Microsoft Entra tenant with Microsoft Graph PowerShell.
---

# Allow or block Business Central self-service signups

Control whether users in your Microsoft Entra tenant can sign up for [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] without an administrator's approval. Use Microsoft Graph PowerShell to allow or block self-service signups and check the current setting.

> [!IMPORTANT]
> This setting applies to email-based self-service subscriptions across your tenant, not just to Business Central. It isn't a per-product control. Self-service purchases and trials managed through the `AllowSelfServicePurchase` policy use separate controls. Learn more in [Manage self-service purchases and trials](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins).

## Prerequisites for managing signups

- An account with the Microsoft Entra Privileged Role Administrator role or a custom role with the required permissions. Privileged Role Administrator is the least privileged built-in role for updating the authorization policy. Learn more in [Update authorizationPolicy](/graph/api/authorizationpolicy-update).
- Administrator consent for the `Policy.ReadWrite.Authorization` delegated permission for Microsoft Graph. The connection command in the next section requests this permission. Learn more in the [Microsoft Graph permissions reference](/graph/permissions-reference#policyreadwriteauthorization).
- A supported PowerShell environment. We recommend PowerShell 7 or later. Learn more in [Install the Microsoft Graph PowerShell SDK](/powershell/microsoftgraph/installation).

## Connect to your Microsoft Entra tenant

1. Open PowerShell and install the module for the current user:

    ```powershell
    Install-Module -Name Microsoft.Graph.Identity.SignIns -Scope CurrentUser -Repository PSGallery
    ```

1. Import the module:

    ```powershell
    Import-Module Microsoft.Graph.Identity.SignIns
    ```

1. Replace `<TenantId>` with the ID of the tenant you want to manage. Run the following command and sign in with your administrator account:

    ```powershell
    Connect-MgGraph -TenantId "<TenantId>" -Scopes "Policy.ReadWrite.Authorization" -ContextScope Process
    ```

## Block self-service signups

After connecting to your tenant, run the following commands:

```powershell
$parameters = @{
    allowedToSignUpEmailBasedSubscriptions = $false
}
Update-MgPolicyAuthorizationPolicy -BodyParameter $parameters
```

The `allowedToSignUpEmailBasedSubscriptions` setting controls whether users can sign up for email-based subscriptions. Setting it to `$false` blocks these signups for the tenant. The update request includes only this property.

Users who are blocked by this policy can't complete self-service signup. They must contact their administrator to request access. If a user reports that their IT department turned off signups, [check the current setting](#check-whether-self-service-signups-are-allowed). You can then decide whether to allow signups or arrange access through your organization's normal process.

Learn more about this tenant-wide setting in [Self-service sign up for email-verified users](/entra/identity/users/directory-self-service-signup).

## Allow self-service signups

To allow email-based self-service signups again, connect to your tenant and run the following commands:

```powershell
$parameters = @{
    allowedToSignUpEmailBasedSubscriptions = $true
}
Update-MgPolicyAuthorizationPolicy -BodyParameter $parameters
```

## Check whether self-service signups are allowed

In the same connected PowerShell session, run the following command:

```powershell
Get-MgPolicyAuthorizationPolicy |
    Select-Object AllowedToSignUpEmailBasedSubscriptions
```

The value is `True` when email-based self-service signups are allowed and `False` when they're blocked.

## Disconnect from Microsoft Graph

When you finish, disconnect your PowerShell session:

```powershell
Disconnect-MgGraph
```

## Related information

[Administration of Business Central online](../administration/tenant-administration.md)  
[Using self-service sign-up in your organization](/microsoft-365/admin/misc/self-service-sign-up)  
[Update-MgPolicyAuthorizationPolicy](/powershell/module/microsoft.graph.identity.signins/update-mgpolicyauthorizationpolicy)  
[Get-MgPolicyAuthorizationPolicy](/powershell/module/microsoft.graph.identity.signins/get-mgpolicyauthorizationpolicy)  
