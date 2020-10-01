---
title: "Enable and Disable Dynamics 365 Business Central Self-service Signups "
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Enable and Disable Dynamics 365 Business Central Self-service Signups

Administrators for an Microsoft 365 Tenant might not want their users to sign up for the [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] service without their awareness. You can complete the following procedure in Azure Active Directory to block individual user signups.  

To complete this procedure, you must install and use Azure AD cmdlets. For a list of MSOnline cmdlets that are available for Azure AD using Windows PowerShell, see [MSOnline](/powershell/module/MSOnline/?view=azureadps-1.0&redirectedfrom=msdn).   

PowerShell commands can be used with Azure Active Directory to disable adhoc (self-service) subscriptions. Please note that these steps are not specific to [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)]. This procedure will disable self-service subscriptions for [any other products and services](https://support.office.com/article/using-self-service-sign-up-in-your-organization-4f8712ff-9346-4c6c-bb63-a21ad7a62cbd ), as Azure AD does not provide tools for blocking signups from specific products. Self-service signups can be re-enabled later. 

## Disable self-service signups
1. Start Windows PowerShell as an administrator.
2. At the command prompt, run the following command to sign in to your Azure AD service. You must provide the credentials of an administrator of the Microsoft 365 service:

    ```PowerShell
    $Msolcred = Get-credential
    ```
2. Run the following command to connect to the Azure AD service using the provided credentials:

    ```PowerShell
    Connect-MsolService -Credential $MsolCred
    ```

3. Run the following command to disable self-service signups:

    ```PowerShell  
    Set-MsolCompanySettings -AllowAdHocSubscriptions $false 
    ```

    When the command has completed, self-service signups are disabled for your Azure Active Directory. Users who try to sign up for [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] or any other self-service products see meassage similar to the following:

    **Sorry...**

    **We can't finish signing you up.**
    
    **Your IT department has turned off signup for [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)]. Contact them to complete signup.** 

 
## Enable self-service signups

To enable self-service signups, follow the same steps to sign in and connect to your Azure AD service, and then run the following command:

```PowerShell  
Set-MsolCompanySettings -AllowAdHocSubscriptions $true 
  
```
## Verify whether signups are enabled or disabled
To see whether self-service signups are enabled or disabled in Azure Active Directory, follow the same steps to sign in and connect to your Azure AD service, then run the following command:

```PowerShell
Get-MsolCompanyInformation | fl AllowAdHocSubscriptions
```
## See Also  
[Announcing Microsoft Dynamics 365 Business Central: greater impact with an end-to-end view](https://cloudblogs.microsoft.com/dynamics365/2018/03/13/announcing-microsoft-dynamics-365-business-central-greater-impact-with-an-end-to-end-view/)  