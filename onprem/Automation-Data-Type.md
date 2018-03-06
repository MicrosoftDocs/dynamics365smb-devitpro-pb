---
title: Automation Data Type
description: This article explains how to use the automation data type to reference an automation server in Microsoft Dynamics NAV and learn the limitations of this type.
ms.custom: na
ms.date: 10/26/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3d37ff31-161a-4181-898f-fbb2b56234b9
caps.latest.revision: 22
manager: edupont
---
# Automation Data Type in Microsoft Dynamics NAV
Use the Automation data type to reference an automation server.  
  
### To use an automation server in [!INCLUDE[navnow](includes/navnow_md.md)]  
  
1.  Define a variable of type Automation and give it a name.  
  
2.  Select the **Subtype** field, and in the **Automation Object List** window that opens, in the **Automation Server** field, get a list of available automation servers.  
  
3.  Select a server and then choose the **OK** button.  
  
     In the **Automation Object List** the interfaces of the selected automation server are displayed.  
  
4.  Select an interface and then choose the **OK** button.  
  
 This procedure has selected the GUID of the automation server, the version number, and the GUID of the interface. It is immediately evaluated into a name such as *\<name of server>*.*\<name of interface>*, as in the following:  
  
```  
'Microsoft Excel X.0 Object Library'.Application  
```  
  
 When you have defined an automation server as a variable, you must use [CREATE Function \(Automation\)](CREATE-Function--Automation-.md) to create an instance of the server. After that, you can use the server through the variable. You can browse its methods and properties in the **Symbol** menu.  
  
 When you are using a server, you should know that there is not a one-to-one relationship between C/AL data types and COM data types. For an overview of the data type mapping, see [Using COM Technologies in Microsoft Dynamics NAV](Using-COM-Technologies-in-Microsoft-Dynamics-NAV.md).  
  
 If you use a variable of type Automation to automate Microsoft Excel and you run an English \(United States\) version of Excel but the regional settings for the computer are configured for a non-English language, then you will receive the following error:  
  
```  
Error: 0x80028018 (-2147647512)  
Description: Old Format or Invalid Type Library   
```  
  
 For more information, see Microsoft Help and Support article [320369: BUG: "Old format or invalid type library" error when automating Excel](http://go.microsoft.com/fwlink/?linkid=3052&kbid=320369).  
  
## Limitations  
  
-   Automation is not supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
-   Automation objects cannot run on [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
## See Also  
 [CREATE Function \(Automation\)](CREATE-Function--Automation-.md)   
 [ISCLEAR Function \(Automation\)](ISCLEAR-Function--Automation-.md)   
 [Variant Data Type](Variant-Data-Type.md)