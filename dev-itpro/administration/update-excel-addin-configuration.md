---
title: "Update the Excel Add-In Configuration"
description: Learn about how to change the Excel add-in setup so that it works with the update in July 2022.
author: jswymer
ms.author: jswymer
ms.custom: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.date: 05/25/2022
---
# Modify the Excel Add-in Configuration to Support July 2022 Update

Starting in July 2022, Microsoft will roll out an update to the Excel add-in. The update will help to secure the connection between the add-in and [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. The update requires that you modify your organization's Azure Active Directory (Azure AD) configuration so that users can continue using the add-in.

> [!NOTE]
> You can make the changes that are described in this article at any time. The existing Excel add-in will work with the changes. So we recommend that you make the changes as soon as possible to avoid any down time when the update occurs.

## How the update will affect your organization

The update affects organizations that have configured the Excel add-in to work with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on premises or similar deployment variants, such as hosted or private cloud. [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online customers aren't affected.

After Microsoft updates the Excel add-in, users will no longer be able to sign in to the add-in. The sign-in process will appear to halt without completing. Users will experience this problem when using the Edit in Excel feature in the Business Central, or working with new and existing Excel files that utilize the add-in. The inability to connect Excel to Business Central applies to all Excel clients and Excel versions supported by the add-in, and all Business Central versions.

## What you need to do to prepare

You'll have to change to the existing Azure AD app registration that's set up for the add-in to use the new single-page application (*spa*) redirect URI instead of the legacy *web* redirect URI. The change requires you have administrative permissions. It only has to be done once for the whole organization. Your registered app may already be configured for *spa*. You can also use the following steps to verify.

1. Sign in to [Azure portal](https://portal.azure.com).
2. Select **Azure Active Directory**. 
3. Under **Manage**, select **App Registrations**.
4. Select the app that was registered to enable users to sign in to the Excel add-in. 
5. Under **Manage**, select **Manifest**.
6. In the manifest, find the following `"url"`entry and change `"type": "Web"` to `"type": "Spa"`:

    ```json  
    {
        "url": "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/*",
        "type": "Spa"
    }
    ```

> [!IMPORTANT]
> Your experience may vary if your Azure AD app registration also includes redirect URIs for other services. Don't not change other redirect URIs for other services or for the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] Web client as part of this change. To check if other services are affected by similar security hardening exercises and require re-configuration, contact the service provider.

## See Also

[Setting up the Business Central Add-in for Excel in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] On-premises](configuring-excel-addin.md)  
[Registering an application Azure Active Directory](/azure/active-directory/develop/quickstart-register-app)    
