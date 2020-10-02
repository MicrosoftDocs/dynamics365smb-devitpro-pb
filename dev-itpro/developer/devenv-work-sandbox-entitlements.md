---
title: "Working with Sandboxes and Entitlements"
description:
ms.author: freddyk
ms.reviewer: solsen
ms.custom: na
ms.date: 10/01/2020
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: freddydk
---

# Working with Development Sandboxes and Entitlements

The experience that a user has in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] depends on the purchased subscription plan. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], there are two main plans; the Essential and the Premium plan, plus a few more. For more information, see [Licensing in Dynamics 365 Business Central](../deployment/licensing.md). For detailed information about the Essential and Premium plans, see [Business Central](https://dynamics.microsoft.com/business-central/overview/) on the Microsoft Dynamics 365 site.  

When you develop in a Docker sandbox, the Essential experience is automatically assigned to you (you set the experience on the **Company Information** page), which makes it difficult to test how a user with the Premium plan assigned will experience what you have developed.

> [!NOTE]  
> There is no license check in a Docker Sandbox except for on Purchase and Sales documents. There is a different behavior in these documents as the **TEAMMEMBER** license has partial access. In particular Invoices, Orders, Quotes and Credit Memos share the same table and the **TEAMMEMBER** license has access only to Quotes.

## Setup for users with different plans

To mimic users with a specific subscription plan assigned, you can set them up with the user groups as detailed in the table below. When you add user to the group, the permission sets defined for the group will apply to the user. For more information, see [To group users in user groups](/dynamics365/business-central/ui-define-granular-permissions#to-manage-permissions-through-user-groups).

> [!NOTE]  
> In the table below *non-default* means not assigned by default, but the plan allows this to be assigned to the user.

|User Name <br>The type of subscription plan <br> assigned to the given user|User Groups|
|---------|-----------
|EXTERNALACCOUNTANT<br><br>Dynamics 365 Business Central External Accountant|D365 EXT. ACCOUNTANT<br>D365 EXTENSION MGT (non-default)<br>D365 TROUBLESHOOT (non-default)<br>D365 SECURITY (non-default)|
|PREMIUM<br><br>Dynamics 365 Business Central Premium<br>Dynamics 365 Business Central for IWs|D365 BUS PREMIUM<br>D365 EXTENSION MGT (non-default)<br>D365 TROUBLESHOOT (non-default)<br>D365 SECURITY (non-default)|
|ESSENTIAL<br><br>Dynamics 365 Business Central Essential|D365 BUS FULL ACCESS<br>D365 EXTENSION MGT (non-default)<br>D365 TROUBLESHOOT (non-default)<br>D365 SECURITY (non-default)|
|INTERNALADMIN<br><br>Internal Administrator (Microsoft 365 Global administrator role)|D365 INTERNAL ADMIN<br>D365 TROUBLESHOOT<br>D365 BACKUP/RESTORE<br>D365 SECURITY (non-default)|
|TEAMMEMBER<br><br>Dynamics 365 for Team Members|D365 TEAM MEMBER<br>D365 TROUBLESHOOT (non-default)<br>D365 SECURITY (non-default)|
|DEVICE    <br><br>Dynamics 365 Business Central Device|D365 FULL ACCESS<br>D365 EXTENSION MGT (non-default)<br>D365 BUS PREMIUM (non-default)* <br>D365 TROUBLESHOOT (non-default)<br><br>D365 SECURITY (non-default)<br><br> *) Please note: usage need to be according to terms in Licensing Guide |
|DELEGATEDADMIN<br><br>Delegated Admin agent - Partner<br>Delegated Helpdesk agent - Partner|D365 EXTENSION MGT<br>D365 FULL ACCESS<br>D365 RAPIDSTART<br>D365 BACKUP/RESTORE<br>D365 TROUBLESHOOT<br>D365 SECURITY (non-default)|

> [!TIP]  
> For more information about how to choose a user experience, see [Changing Which Features are Displayed](/dynamics365/business-central/ui-experiences#choosing-a-user-experience-to-show-or-hide-features).

## Assigning the Premium plan to test users
Depending on how you are running your Docker sandbox, you assign the experience in different ways.

### Azure VMs
If you use [https://aka.ms/bcsandbox](https://aka.ms/bcsandbox) to create your [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Sandbox Container Azure VM, the Azure Resource Manager template has two fields; **Assign Premium Plan** and **Create Test Users**, which by default are set to **Yes**.

**Assign Premium Plan** specifies whether or not your admin user should be assigned a Premium plan. **Create Test Users** specifies whether or not you want the setup to include test users. 

### NavContainerHelper
If you are using `New-BCContainer` to create your [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Sandbox container, you must make sure that you are using version 0.2.8.3 or later.

Use the switch `assignPremiumPlan` on `New-BCContainer` like this:

```
New-BCContainer -accept_eula -updateHosts -containerName test -artifactUrl (Get-BCArtifactUrl -country us) -assignPremiumPlan
```

This assigns the Premium plan to your default admin user. Internally this just adds a record to the **User Plan** table.

To create the test users, you must call the `Setup-BCContainerTestUsers` method:

```
Setup-BCContainerTestUsers containerName test -tenant default -password $securePassword
```

specifying the container and the password that you want to use for the new users.

Internally, the `Setup-BCContainerTestUsers` downloads an app which exposes an API, publishes and installs the app, and then invokes the `CreateTestUsers` API with the password needed. After this, the app is uninstalled and unpublished.

If you want to see code behind the app, it is available [here](https://dev.azure.com/businesscentralapps/CreateTestUsers).

### Docker run
If you are using Docker run to run your containers, you have a little more work to do.

First of all, you must override the `SetupNavUsers.ps1` by sharing a local folder to `c:\run\my` in the container and place a file called `SetupNavUsers.ps1` in that folder with the following content:

```
# Invoke default behavior
. (Join-Path $runPath $MyInvocation.MyCommand.Name)
 
Get-NavServerUser -serverInstance NAV -tenant default |? LicenseType -eq "FullUser" | % {
    $UserId = $_.UserSecurityId
    Write-Host "Assign Premium plan for $($_.Username)"
    sqlcmd -S 'localhostSQLEXPRESS' -d $DatabaseName -Q "INSERT INTO [dbo].[User Plan] ([Plan ID],[User Security ID]) VALUES ('{8e9002c0-a1d8-4465-b952-817d2948e6e2}','$userId')" | Out-Null
}
```

This will assign the Premium plan to the admin user in the database.

> [!TIP]  
> To set up test users, you can clone the [createtestusers](https://dev.azure.com/businesscentralapps/CreateTestUsers) repository and modify the code to create the users on the `oninstall` trigger with the password that you want.

## See Also

[Programming in AL](devenv-programming-in-al.md)  
[Choosing Your Dynamics 365 Business Central Development Sandbox Environment](devenv-sandbox-overview.md)  
[Container Sandbox](devenv-get-started-container-sandbox.md)  
[Changing Which Features are Displayed](/dynamics365/business-central/ui-experiences#choosing-a-user-experience-to-show-or-hide-features)  
[Production and Sandbox Environments](../administration/environment-types.md)  
