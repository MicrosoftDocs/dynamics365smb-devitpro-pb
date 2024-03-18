---
title: "Installing AL with Microsoft Dynamics NAV"
description: "Description of how to install AL and Microsoft Dynamics NAV"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

# Installing AL with Microsoft Dynamics NAV
To add the AL development environment capability with [!INCLUDE[navnow_md](includes/navnow_md.md)] you must first do a custom installation and select **Modern Development Environment**. For more information, see [Custom Option](../custom-option.md).

After the installation is done, to use the AL Language extension, follow these steps:
1. Download and install [Visual Studio Code](https://code.visualstudio.com/).
2. Open Visual Studio Code, and then from the **Extensions** menu, choose **Install from VSIX**
3. From the equivalent folder of `C:\Program Files(x86)\Microsoft Dynamics NAV\110\Modern Development Environment\` locate the ALLanguage.vsix file and install it.  
    
> [!TIP]  
> To run both AL and C/SIDE see [Running C/SIDE and AL Side-by-Side](devenv-running-cside-and-al-side-by-side.md).

## See Also  
[Custom Option](../custom-option.md)  
[Differences in the Development Environments](devenv-differences.md)