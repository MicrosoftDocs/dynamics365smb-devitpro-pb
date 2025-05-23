---
title: Sandbox environments for Dynamics 365 Business Central development
description: Overview of the differences between the offered sandbox environments for Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.date: 03/01/2024
ms.topic: overview
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Sandbox environments for Business Central development

To get started developing for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], it's important to understand the different options you have at hand. You can either choose to run a sandbox environment deployed as a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] service, or you can run a container-based image either hosted as an Azure VM, or locally. Both options provide the AL development tools; the container-based sandbox additionally provides access to the C/SIDE development tools. You can also choose to run a sandbox environment with production data using the **Business Central Admin Center**. For more information, see [Business Central Admin Center](../administration/tenant-admin-center.md).

> [!NOTE]  
> Extensions that have been published to a sandbox environment from Visual Studio Code or created using [Designer](devenv-inclient-designer.md) are removed when the environment is updated or relocated within our service. For more information, see [Production and sandbox environments](../administration/environment-types.md) and [FAQ for developing in AL](devenv-dev-faq.md).

> [!IMPORTANT]  
> From Visual Studio Code it's not supported to publish an extension with the same identifiers as an extension published to AppSource. Identifiers include the combination of appID and version or name, publisher, and version. If you publish such an extension, it can be removed at any time.

## Development sandbox overview

The following table outlines the most important capabilities on the offered development sandbox environments for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].  

|Capability |Online Sandbox |Container Sandbox|
|-----------|--------|----------------|
|Deployment |Dynamics 365 Cloud Service managed by Microsoft|Azure VM or on-premises managed by ISV/VAR|
|Production data|Manually uploaded using Rapid Start packages. Or, available through the [Business Central Admin Center](../administration/tenant-admin-center.md). |Manually uploaded using Rapid Start packages|
|Production services|Manually configured|Not available|
|Cost|Part of the Business Central subscription|Locally hosted - free, Azure-hosted - cost incurred|
|Development|Full capabilities of the development environment. </br>Designer functionality, such as: </br>Add/Remove components, </br>Move components, </br>Set/clear Freeze pane, </br>Edit captions | Full capabilities of the development environment.</br>Designer functionality, such as: </br>Add/Remove components, </br>Move components, </br>Set/clear Freeze pane, </br>Edit captions |
|Tools|Visual Studio Code, Designer|Visual Studio Code, Designer, on-premises tools such as SQL Server Management Studio, and C/SIDE.|
|Debugging|Enabled|Enabled|
|Database access|No|Yes|
|**Extensions**|Must be manually installed.| Must be manually installed.|
|From AppSource|Available.|Not available.|
|From File|Available.|Available.|
|From Visual Studio Code|Available.|Available.|

## Get started

Based on the overview in the previous section and the requirements for your development environment, you can get started with a sandbox by following the links below:

+ [Online sandbox with demo data](devenv-get-started.md)  
+ [Online sandbox with production data](../administration/tenant-admin-center.md)  
+ [Container sandbox](devenv-get-started-container-sandbox.md)  

## Related information

[Get started with AL](devenv-get-started.md)  
[Keyboard shortcuts](devenv-keyboard-shortcuts.md)  
[AL development environment](devenv-reference-overview.md)  
[Production and sandbox environments](../administration/environment-types.md)  
