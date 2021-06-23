---
title: "NavApp.DeleteArchiveData Method"
description: "Deletes the archived data for a specified table of an extension during installation."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# NavApp.DeleteArchiveData Method
> **Version**: _Available or changed with runtime version 1.0 until version 6.0 where it was deprecated for the following reason: "The features related to data migration from V1 to V2 extensions are being deprecated."_

Deletes the archived data for a specified table of an extension during installation.


## Syntax
```AL
 NavApp.DeleteArchiveData(TableNo: Integer)
```
## Parameters
*TableNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the table for which to delete archived data.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)


If you omit this optional return value and if archived data cannot be deleted for the specified table, then a run-time error occurs. If you include a return value, then it is assumed that you will handle any errors and no run-time error occurs, even though the archived data is not deleted.  

## Remarks
You use this method as part of the upgrade code for an extension, where it is called from the `OnNavAppUpgradePerDatabase()` or `OnNavAppUpgradePerCompany()` system methods. When an extension is uninstalled, the data in application tables of the extension is automatically stored into a set of special tables so that the data is still preserved. With the DeleteARCHIVEDATA method, you can delete the archived data from the application table of the new version of an extension when it is installed.

## See Also
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)