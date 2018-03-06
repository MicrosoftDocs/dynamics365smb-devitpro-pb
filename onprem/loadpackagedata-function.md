---
author: edupont04
title: "LOADPACKAGEDATA Function"
ms.custom: na
ms.date: 11/02/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: edupont
---
# LOADPACKAGEDATA Function
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
You use this function as part of the upgrade code for an extension, where it is called from the `OnNavAppUpgradePerDatabase()` or `OnNavAppUpgradePerCompany()` system functions. With the LOADPACKAGEDATA function, you can populate a new table in your extension with data to help users get started using your extension. For more information, see [Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md).  

## See Also  
[Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md)  
[How to: Develop an Extension](How-to--Develop-an-Extension.md)  
