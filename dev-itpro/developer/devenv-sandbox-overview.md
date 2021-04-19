---
title: "Sandbox Environments for Dynamics 365 Business Central Development"
description: "Overview of the differences between the offered sandbox environments for Dynamics 365 Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Sandbox Environments for Dynamics 365 Business Central Development

To get started developing for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] it is important to understand the different options you have at hand. You can either choose to run a sandbox environment deployed as a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] service, or you can run a container-based image either hosted as an Azure VM or locally. Both options provide the AL development tools; the container-based sandbox additionally provides access to the C/SIDE development tools. You can also choose to run a sandbox environment with production data using the **Business Central Admin Center**. For more information, see [Business Central Admin Center](../administration/tenant-admin-center.md).

> [!NOTE]  
> Extensions that have been published to a sandbox environment from Visual Studio Code or created using [Designer](devenv-inclient-designer.md) are removed when the environment is updated or relocated within our service. For more information, see [Production and Sandbox Environments](../administration/environment-types.md).  

> [!IMPORTANT]  
> It is not supported to publish, from Visual Studio Code, an extension with the same identifiers as an extension published to AppSource. Identifiers include the combination of appID and version or name, publisher, and version. If you do publish such an extension, it can be removed at any time.

## Development sandbox overview

The following table outlines the most important capabilities on the offered development sandbox environments for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].  

|Capability |Online Sandbox |Container Sandbox|
|-----------|--------|----------------|
|Deployment |Dynamics 365 Cloud Service managed by Microsoft|Azure VM or on-premises managed by ISV/VAR|
|Production data|Manually uploaded using Rapid Start packages. Or, available through the [Business Central Admin Center](../administration/tenant-admin-center.md). |Manually uploaded using Rapid Start packages|
|Production services|Manually configured|Not available|
|Cost|Part of the Business Central subscription|Locally hosted - free, Azure-hosted - cost incurred|
|Development|Full capabilities of the development environment. </br>Designer functionality, such as: </br>Add/Remove components, </br>Move components, </br>Set/clear Freeze pane, </br>Edit captions | Full capabilities of the development environment.</br>Designer functionality, such as: </br>Add/Remove components, </br>Move components, </br>Set/clear Freeze pane, </br>Edit captions |
|Tools|Visual Studio Code, Designer|Visual Studio Code, Designer, on-premise tools such as SQL Server Management Studio, and C/SIDE.|
|Debugging|Enabled|Enabled|
|Database access|No|Yes|
|**Extensions**|Must be manually installed.| Must be manually installed.|
|From AppSource|Available.|Not available.|
|From File|Available.|Available.|
|From Visual Studio Code|Available.|Available.|

## Getting started

Based on the overview above and the requirements for your development environment, you can get started with a sandbox by following the links below:

+ [Online Sandbox with Demo Data](devenv-get-started.md)  
+ [Online Sandbox with Production Data](../administration/tenant-admin-center.md)  
+ [Container Sandbox](devenv-get-started-container-sandbox.md)  

## See Also

[Getting Started with AL](devenv-get-started.md)  
[Keyboard Shortcuts](devenv-keyboard-shortcuts.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Production and Sandbox Environments](../administration/environment-types.md)  
