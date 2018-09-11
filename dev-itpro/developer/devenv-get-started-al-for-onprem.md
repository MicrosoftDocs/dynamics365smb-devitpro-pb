---
title: "Getting Started with C/SIDE and AL Side-By-Side for On-Premises"
description: "Description of how to get started with the new development environment along with C/SIDE."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 09/11/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Getting Started with C/SIDE and AL for On-Premises
To get started with a mixed development environment of C/SIDE and AL, you must follow the steps below. 

## Steps to install Business Central on-premises with C/SIDE and AL development environment

1. Install [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises and make sure to include the **AL Development Environment**.
2. Download [Visual Studio Code](https://code.visualstudio.com/Download).  
3. From Visual Studio Code, locate **Extensions** in the left navigation bar, and then choose **Install from vsix**. 
4. Browse to the equivalent folder of `C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\130\AL Development Environment` and then choose **Install**.
5. Now, press **Alt+A, Alt+L** to trigger the **AL Go!** command, choose a project, and then choose **Your own server**.  
6. Authenticate with the credentials you use for signing into [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises.  
7. In the launch.json file, update the `"server": "http://localhost"` setting with the URL for server running [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises and save the file.
8. In the app.json file, add the `"target": "Internal"` setting.
9. ...

> [!TIP]  
> For information about which sandboxes you can choose, see [Choosing Your Dynamics 365 Business Central Development Sandbox Environment](devenv-sandbox-overview.md).

> [!NOTE]  
> Build and get inspired by our sample library on [GitHub](https://github.com/Microsoft/al).

## See Also 
[AL Development Environment](devenv-reference-overview.md)  
[FAQ for Developing in AL](devenv-dev-faq.md)  
