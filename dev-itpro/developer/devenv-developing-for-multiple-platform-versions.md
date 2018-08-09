---
title: Developing for Multiple Platform Versions
description: The AL language extension is compatible with multiple platform versions for developing solutions in marketplace. 
ms.custom: na
ms.date: 08/02/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ddb133b9-e940-4db8-bf3a-e5f906600188
caps.latest.revision: 24
author: SusanneWindfeldPedersen
---

# Developing for Multiple Platform Versions   

> [!IMPORTANT]  
> [!INCLUDE[vnext_preview](includes/vnext_preview.md)]

The AL language extension is compatible with multiple platform versions. You can install the AL Language extension from the Visual Studio Code marketplace and use it to develop solutions for [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)].

## Defining platform version
To set the platform version, add the **runtime** property in the `app.json` file. This attribute defines the platform runtime version that the extension is targeting. Depending on the platform version, some features become available, while some features are not supported. For example, OData-bound actions can only be used when the platform version is 2.0 or higher. <!-- For more information about bound actions, see [Bound Actions]().   -->

In the runtime property, the **Latest** value is the default value. When you set the **Latest** as the `runtime` property value, you enable the newest available platform  version by default. For example, in the following image, the **Latest** runtime value represents the **2.0 Business Central Fall 2018** version. 

![Runtime Property](media/runtime.png)

> [!NOTE]  
> AL Language extension is not compatible with [!INCLUDE[nav_2018_short_md](includes/nav_2018_short_md.md)] version backwards. For [!INCLUDE[nav_2018_short_md](includes/nav_2018_short_md.md)] development, the traditional method should be used. You must install the Visual Studio Code extension from the `ALLanguage.vsix` file shipped on the DVD. 

## Version compatibility
When publishing an extension, there are two things to compare:
1. The runtime version in the extension manifest, which is defined in the app.json file. 
2. The runtime version of the platform. 

When you set the extension to a higher runtime version, the extension package may contain certain features that the platform may not support which would result in an error. Therefore, you must lower the extension runtime version to support the platform runtime version. Also, you must note that by lowering the extension runtime version, you may get warnings about the latest features not being supported by the earlier platform versions.

**Scenario 1**: When publishing an extension which is compiled with a higher runtime version than the platform supports, an error will be thrown. For example, if you set the runtime value to `2.0`, you get the following error message. 

```
The runtime version of the extension package is currently set to '2.0'. The runtime version must be set to '1.0' or earlier in the app.json file in order to install the extension package on this platform.
```

**Scenario 2**: When publishing an extension which is compiled with a lower runtime version than the platform supports, a best-effort compilation is made. This is allowed in order to avoid recompilation of the extension packages every time you upgrade the platform. 

## See Also
[Debugging in AL](devenv-debugging.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
