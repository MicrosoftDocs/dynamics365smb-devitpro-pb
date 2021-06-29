---
title: "NavApp.LoadPackageData Method"
description: "Loads default, or starting, table data into the specified table of an extension during installation."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.LoadPackageData Method
> **Version**: _Available or changed with runtime version 1.0._

Loads default, or starting, table data into the specified table of an extension during installation.


## Syntax
```
 NavApp.LoadPackageData(TableNo: Integer)
```
## Parameters
*TableNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the table for which to load package data.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
You use this method as part of the upgrade code for an extension, where it is called from the `OnNavAppUpgradePerDatabase()` or `OnNavAppUpgradePerCompany()` system methods. With the LOADPACKAGEDATA method, you can populate a new table in your extension with data to help users get started using your extension. <!--Links For more information, see [Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md).-->  

## See Also
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)