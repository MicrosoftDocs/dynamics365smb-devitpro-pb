---
title: "Developing for Multiple Platform Versions"
description: "The AL language extension is compatible with multiple platform versions for developing solutions in marketplace." 
ms.custom: na
ms.date: 10/01/2020
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

The AL language extension is compatible with multiple platform versions. You can install the AL Language extension from the Visual Studio Code marketplace and use it to develop solutions for [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)].

## Defining the platform version
To set the platform version, add the **runtime** property in the `app.json` file. This attribute defines the platform version that the extension is targeting. Depending on the platform version, some features become available, while some features are not supported. For example, OData-bound actions can only be used when the platform version is 2.0 or higher. 

> [!NOTE]  
> The AL Language extension is not compatible with [!INCLUDE[nav_2018_short_md](includes/nav_2018_short_md.md)] version backwards. For [!INCLUDE[nav_2018_short_md](includes/nav_2018_short_md.md)] development, the traditional method should be used. You must install the Visual Studio Code extension from the `ALLanguage.vsix` file shipped on the DVD. 

## Version compatibility

The following two elements are compared when you publish an extension.
1. The runtime version of the extension defined in the app.json file.
2. The runtime version of the platform that the extension is targeting.

In the app.json file, set the extension **runtime** version lower than the platform version. When you set the extension to a higher **runtime** version, the extension package may contain certain features that the platform may not support which would result in an error. Therefore, you must lower the extension runtime version than the one that platform supports in order to publish your extension.

### Things to be aware of
1. An error will be thrown when you publish an extension with a higher runtime version than the one that platform supports. For example, if you set the runtime value to `2.0`, you get the following error message. 

    ```
    The runtime version of the extension package is currently set to '2.0'. The runtime version must be set to '1.0' or earlier in the app.json file in order to install the extension package on this platform.
    ```
2. When you lower the extension runtime version, you may get warnings about the newest features not supported by the earlier versions of the platform.

3. A best-effort compilation is made when you publish an extension compiled with a lower runtime version. This is allowed in order to avoid recompilation of the extension package every time you upgrade the platform. 

## See Also
[Debugging in AL](devenv-debugging.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
