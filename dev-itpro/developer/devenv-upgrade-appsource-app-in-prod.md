---
title: "Upgrading AppSource Apps in Production"
description: "Describes how to upgrade apps available on AppSource that are already in running in production."
author: ryanweigel

ms.custom: na
ms.date: 10/01/2019
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: rweigel
---

# Upgrading AppSource Apps in Production
When an updated version of an AppSource app becomes the active version in the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] service, tenants do not automatically get this updated version. This upgrade must be done manually. 

## To upgrade an AppSource app
Follow the steps below to update a tenant to the latest version of any AppSource app.

1. Login to the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Web client.
2. In the **Tell Me** box, enter **Extension Management**, and then choose the related link.
3. Locate the app that you want to update.
4. Under **Manage**, choose **Uninstall**.
5. When the uninstall is complete, choose **Install** to reinstall the app.  
This will now update the app to the latest available version

For [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] “Major” releases (April and October), every app installed on your tenant will be updated automatically to the latest available version in our service.

## See Also  
[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[How to: Publish and Install an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
