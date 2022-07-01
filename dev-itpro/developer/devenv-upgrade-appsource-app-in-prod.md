---
title: "Upgrading AppSource Apps in Production"
description: "Describes how to upgrade apps available on AppSource that are already in running in production."
author: SusanneWindfeldPedersen

ms.custom: na
ms.date: 08/19/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: freddyk
---

# Upgrading AppSource Apps in Production

When an updated version of an AppSource app becomes the active version in the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] service, tenants do not automatically get this updated version. This upgrade must be done manually by getting the latest version of the app in AppSource. 

## To upgrade an AppSource app

Follow the steps below to update a tenant to the latest version of any AppSource app.

1. Log in to the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] browser client.
2. In the **Tell Me** box, enter **Extension Management**, and then choose the related link.
3. Locate the app that you want to update.
4. Under **Manage**, choose **Uninstall**.
5. Go to [AppSource](https://appsource.microsoft.com/marketplace/apps?product=dynamics-365%3Bdynamics-365-business-central&page=1) and then install the app again.  

> [!NOTE]  
> An alternative, is to use the Admin Center, where you can also manage the upgrade, given that you have the right permissions. For more information, see [Managing Apps](../administration/tenant-admin-center-manage-apps.md).

## See Also  

[Developing Extensions](devenv-dev-overview.md)  
[Get Started with AL](devenv-get-started.md)  
[How to: Publish and Install an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
