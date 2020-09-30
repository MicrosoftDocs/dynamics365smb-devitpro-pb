---
title: "NavApp.RestoreArchiveData Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.RestoreArchiveData Method
Restores archived data for a specified table of an extension during installation.


## Syntax
```
[Ok := ]  NavApp.RestoreArchiveData(TableNo: Integer [, RunTrigger: Boolean])
```
## Parameters
*TableNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the table for which to restore achived data.  
*RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the table triggers should run, otherwise **false**.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true**, if the archived data was restored for the specified table; otherwise **false** If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
You use this method as part of the upgrade code for an extension, where it is called from the `OnNavAppUpgradePerDatabase()` or `OnNavAppUpgradePerCompany()` system methods. When an extension is uninstalled, the data in application tables of the extension is automatically stored into a set of special tables so that the data is still preserved. With the RESTOREARCHIVEDATA method, you can restore the archived data to the application table of the new version of an extension when it is installed. 

## See Also
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)