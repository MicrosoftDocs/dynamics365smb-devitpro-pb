---
title: AL Code Navigation
description: This topic describes how to use the Go To Definition feature when debugging the AL code in Dynamics 365 Business Central. 
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/25/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9cfc02d2-2211-466f-b5e9-8178bdc79311
ms.author: solsen
---

# AL Code Navigation
When you develop an AL extension, you may want to navigate around the source code frequently. To jump around the code or to access the reference code, you use the Go To Definition feature in Visual Studio Code. 

## Go To Definition
The Go To Definition feature navigates to the source of a type and opens the result in a new tab. You can use the `F12` shortcut key or right click and select the Go To Definition feature from the right click menu. The Go To Definition opens the source in the `.dal` format which contains the base app code. For example, the base app code may contain table metadata and application methods. In the following illustration, you can see the Address and HasAddress type opens the `Customer.dal` file and locates the reference code of those types by using the Go To Definition feature. 
<!--
you can access the source code of the Address and HasAddress type which opens in a new tab called `Customer.dal`.  -->

![F12](media/F12.gif)

Using the Go To Definition feature, you can jump to the source code and set breakpoints on the base app code. For more information, see [Debugging in AL](devenv-debugging.md).

You can always use the Go To Definition feature on Dynamics 365 Business Central code. However, if you want to use the Go To Definition feature on other V2 extensions, the V2 extension package which is now referenced, when originally published, should have the `showMyCode` property set to **true**. For example, if A is referencing B you can only use the Go To Definition on types of B, when B was published, it was published with `showMyCode = true`. For more information, see [Security Setting and IP Protection](devenv-security-settings-and-ip-protection.md). 


For more information about code navigation in Visual Studio Code, see [Code Navigation](https://code.visualstudio.com/docs/editor/editingevolved).

<!-- 
To use the Go To Definition on local server, it requires that the AL symbols are rebuilt and downloaded from C/SIDE. The application symbols that were built with the previous version of C/SIDE would not make it possible to have Go To Definition work on base application methods. -->

## See Also  
[Developing Extensions](devenv-dev-overview.md)  
[JSON Files](devenv-json-files.md)  
[Debugging in AL](devenv-debugging.md)  


