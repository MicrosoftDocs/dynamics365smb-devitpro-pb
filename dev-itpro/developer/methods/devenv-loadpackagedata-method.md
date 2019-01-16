---
author: edupont04
title: "LOADPACKAGEDATA Method"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-business-central
ms.author: edupont
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---

 

# LOADPACKAGEDATA Method
Loads default, or starting, table data into the specified table of an extension during installation.  
## Syntax  

```  
LOADPACKAGEDATA (TableNo)  
```  

#### Parameters

*TableNo*  
Type: Integer  

Specifies the ID of the extension table that you want to add data to.  


## Remarks
You use this method as part of the upgrade code for an extension, where it is called from the `OnNavAppUpgradePerDatabase()` or `OnNavAppUpgradePerCompany()` system methods. With the LOADPACKAGEDATA method, you can populate a new table in your extension with data to help users get started using your extension. <!--Links For more information, see [Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md).-->  

<!--Links
## See Also  
[Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md)  
[How to: Develop an Extension](How-to--Develop-an-Extension.md)-->  
