---
title: Enable and disable Business Central self-service signups
ms.date: 11/09/2024
ms.topic: conceptual
author: jswymer
description: Learn how to prevent Microsoft Entra tenant users from self-service sign ups
---

# Enable and disable Business Central self-service signups

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

Administrators for a Microsoft 365 tenant might not want their users to sign up for the [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] service without their awareness. You can complete the following procedure in Microsoft Entra ID to block individual user signups.  

To complete this procedure, you must install and use Microsoft Entra ID cmdlets. For a list of MSOnline cmdlets that are available for Microsoft Entra ID using Windows PowerShell, see [MSOnline](/powershell/module/MSOnline/). 

PowerShell commands can be used with Microsoft Entra ID to disable adhoc (self-service) subscriptions. 

> [!NOTE]
> These steps aren't specific to [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)]. This procedure disables self-service subscriptions for [any other products and services](https://support.office.com/article/using-self-service-sign-up-in-your-organization-4f8712ff-9346-4c6c-bb63-a21ad7a62cbd ). Microsoft Entra ID doesn't provide tools for blocking signups from specific products. You can reenable self-service signupslater.

## Disable self-service signups

1. Start Windows PowerShell as an administrator.
1. At the command prompt, run the following command to import the PowerShellGet module:

    ```PowerShell
    Import-Module PowerShellGet
    ```

1. Run the following command to connect to the Microsoft Entra service. You must provide your user name and password for managing the Microsoft Entra tenant.

    ```PowerShell
    Connect-MsolService
    ```

1. Run the following command to disable self-service signups:

    ```PowerShell  
    Set-MsolCompanySettings -AllowAdHocSubscriptions $false 
    ```

    When the command completes, self-service signups are disabled for your Microsoft Entra ID. Users who try to sign up for [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] or any other self-service products get a message similar to:

    **We can't finish signing you up.**

    **Your IT department has turned off signup for [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)]. Contact them to complete signup.** 


## Enable self-service signups

To enable self-service signups, follow the same steps to sign in and connect to your Microsoft Entra service, and then run the following command:

```PowerShell  
Set-MsolCompanySettings -AllowAdHocSubscriptions $true 
```

## Verify whether signups are enabled or disabled

To check whether self-service signups are enabled in Microsoft Entra ID, follow the same steps to sign in and connect to the Microsoft Entra service. Then run the following command:

```PowerShell
Get-MsolCompanyInformation | fl AllowAdHocSubscriptions
```

## Related info

[Administration of Business Central Online](../administration/tenant-administration.md)
