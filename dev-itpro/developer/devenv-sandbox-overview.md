---
title: "Choosing Your Dynamics 365 Business Central Development Sandbox Environment"
description: "Overview of the differences between the offered sandbox environments for Dynamics 365 Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/16/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Choosing Your Dynamics 365 Business Central Development Sandbox Environment
To get started developing for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] it is important to understand the different options you have at hand. You can either choose to run a sandbox environment deployed as a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] service, or you can run a container-based image either hosted as an Azure VM or locally. Both options provide the AL development tools; the container-based sandbox additionally provides access to the C/SIDE development tools.

## Sandbox Overview
The following topic outlines the most important capabilities on the offered development sandbox environments for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. 

|Capability |Online Sandbox |Container Sandbox|
|-----------|--------|----------------|
|Deployment |Dynamics 365 Cloud Service managed by Microsoft|Azure VM or on-premises managed by ISV/VAR|
|Production data|Manually uploaded using Rapid Start packages|Manually uploaded using Rapid Start packages|
|Production extensions|Manually installed|Production installed extensions are automatically installed|
|Production services|Manually configured|Not available|
|Cost|Part of the Business Central subscription|Locally hosted - free, Azure-hosted - cost incurred|
|Development|Full capabilities of the development environment. </br>Designer functionality, such as: </br>Add/Remove components, </br>Move components, </br>Set/clear Freeze pane, </br>Edit captions | Full capabilities of the development environment.</br>Designer functionality, such as: </br>Add/Remove components, </br>Move components, </br>Set/clear Freeze pane, </br>Edit captions |
|Tools|Visual Studio Code, Designer|Visual Studio Code, Designer, on-premise tools such as SQL Server Management Studio and C/SIDE.|
|Debugging|Enabled|Enabled|
|Database access|No|Yes|

## Getting Started
Based on the overview above and the requirements for your development environment, you can get started with a sandbox by following the links below:

+ [Online Sandbox](devenv-get-started.md)  
+ [Container Sandbox](devenv-get-started-container-sandbox.md)  

## See Also
[Getting Started with AL](devenv-get-started.md)  
[Keyboard Shortcuts](devenv-keyboard-shortcuts.md)    
[AL Development Environment](devenv-reference-overview.md)  
