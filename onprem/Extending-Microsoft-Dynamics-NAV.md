---
title: "Extending Microsoft Dynamics NAV"
ms.author: solsen
ms.date: 10/01/2018
ms.topic: article
ms.assetid: f81f6fbf-f5ae-498f-9b7b-4f9aa4f369d4
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---
# Extending Microsoft Dynamics NAV
This section describes how you can extend the functionality of [!INCLUDE[navnowlong](includes/navnowlong_md.md)] by using the following features.  
  
|Feature|Description|See|  
|-------------|-----------------|---------|  
|Component Object Model \(COM\) technologies|You can extend the functionality by implementing automation and custom controls. The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] supports automation servers by acting as an automation controller and using OCXs \(custom controls\).<br /><br /> **NOTE:** COM is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)].|[Extending Microsoft Dynamics NAV Using COM](Extending-Microsoft-Dynamics-NAV-Using-COM.md)|  
|Microsoft .NET Framework interoperability|You can extend the [!INCLUDE[rtc](includes/rtc_md.md)]s and [!INCLUDE[nav_server](includes/nav_server_md.md)] with functionality that is available in Microsoft .NET Framework assemblies. You can take advantage of .NET Framework interoperability so that [!INCLUDE[navnow](includes/navnow_md.md)] objects can interact with the .NET Framework objects.|[Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)|  
|Control add-ins|With [!INCLUDE[navnow](includes/navnow_md.md)] you can write control add-ins that add custom functionality to Role Centers and pages on all display targets, using the same extensibility framework.|[Extending Any Microsoft Dynamics NAV Client Using Control Add-ins](Extending-Any-Microsoft-Dynamics-NAV-Client-Using-Control-Add-ins.md)|  
|Extensions|The extensions framework provides a way to extend and customize a [!INCLUDE[navnow](includes/navnow_md.md)] deployment without the need to directly modify source objects.|[Developing Extensions in AL](developer/devenv-dev-overview.md)|  
  
> [!NOTE]  
>  When [!INCLUDE[navnow](includes/navnow_md.md)] data is consumed in a browser or by a Microsoft .NET Framework assembly, users cannot be authenticated if their user name or password contains Unicode characters. This is a limitation in the basic authentication mechanism that is defined in the HTTP/1.1 specification.  
>   
>  The same limitation applies to exposing [!INCLUDE[navnow](includes/navnow_md.md)] data in web services.  
  
## See Also  
 [Extending Microsoft Dynamics NAV Using COM](Extending-Microsoft-Dynamics-NAV-Using-COM.md)   
 [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)   
 [Extending the Windows Client Using Control Add-ins](Extending-the-Windows-Client-Using-Control-Add-ins.md)   