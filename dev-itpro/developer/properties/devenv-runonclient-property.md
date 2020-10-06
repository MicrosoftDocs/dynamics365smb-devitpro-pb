---
title: "RunOnClient Property"
description: Explains the RunOnClient property in Business Central.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
author: SusanneWindfeldPedersen
---
# RunOnClient Property
Sets whether a .NET object that is defined by a variable is run on the [!INCLUDE[webclient](../includes/webclient.md)] or [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].  

## Applies to  
 Variables of the **DotNet** data type.  

## Syntax 
```
 [RunOnClient]
 Camera: DotNet UT_CameraProvider;
``` 

## Remarks  
 The **RunOnClient** property is used alongside safe listed APIs that provide access to client-side device capabilities, such as camera or location.

 The **RunOnClient** property is part of .NET interoperability in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] that you can use to expand your solution using .NET assemblies. With .NET interoperability, you can call methods and properties in a class of a .NET assembly from AL code by defining a variable for the class. When you set the **RunOnClient** property on a variable, then the class instance that is defined by the variable is instantiated on the [!INCLUDE[webclient](../includes/webclient.md)].  

<!--
## See Also  
 [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)   
 [How to: Call .NET Framework Types From AL Code](How-to-Call-.NET-Framework-Types-From-AL-Code.md)
-->

## See Also
[Properties](devenv-properties.md)  
[Implementing Location in AL](../devenv-implement-location-al.md)  
[Implementing Camera in AL](../devenv-implement-camera-al.md) 
