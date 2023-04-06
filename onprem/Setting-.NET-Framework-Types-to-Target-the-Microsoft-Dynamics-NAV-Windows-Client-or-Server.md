---
title: "Setting .NET Framework Types to Target the Microsoft Dynamics NAV Windows Client or Server"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 631f5c0e-5be3-4e24-87b0-6d01278e0786
caps.latest.revision: 8
---
# Setting .NET Framework Types to Target the Microsoft Dynamics NAV Windows Client or Server
To extend a [!INCLUDE[navnow](includes/navnow_md.md)] object by using .NET Framework interoperability, you define a C/AL variable that calls members of a .NET Framework type in an assembly. When the variable is called from the C/AL code of the [!INCLUDE[navnow](includes/navnow_md.md)] object, it creates an instance of the .NET Framework type. You can set the type instance to target the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] \(client-side object\) or [!INCLUDE[nav_server](includes/nav_server_md.md)] \(server-side object\). By default, a type is set to target [!INCLUDE[nav_server](includes/nav_server_md.md)]. However, you can set the type to target the [!INCLUDE[rtc](includes/rtc_md.md)].  
  
## Microsoft Dynamics NAV Web Client Support  
 For the [!INCLUDE[nav_web](includes/nav_web_md.md)], you can only implement Microsoft .NET Framework interoperability objects that target [!INCLUDE[nav_server](includes/nav_server_md.md)]. Microsoft .NET Framework interoperability objects that target the client are not supported.  
  
## Best Practices  
 Use the following best practices when you extend [!INCLUDE[navnow](includes/navnow_md.md)] objects:  
  
-   To optimize performance, you should limit the calls between client-side and server-side objects. If possible, you should run objects server-side, especially for advanced operations.  
  
-   If the client-side and server-side objects will share data, such as return values and parameters, then the .NET Framework types that define the objects must be capable of being serialized.  
  
## See Also  
 [How to: Set .NET Framework Types to Run on the Microsoft Dynamics NAV Windows Client or Microsoft Dynamics NAV Server Computers](How-to--Set-.NET-Framework-Types-to-Run-on-the-Microsoft-Dynamics-NAV-Windows-Client-or-Microsoft-Dynamics-NAV-Server-Computers.md)   
 [Serializing .NET Framework Types](Serializing-.NET-Framework-Types.md)
