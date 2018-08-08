---
title: "RestoreArchiveData Method"
ms.author: solsen
ms.custom: na
ms.date: 08/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# RestoreArchiveData Method
Restores archived data for a specified table of an extension during installation.

## Syntax
```
[Ok := ]  NavApp.RestoreArchiveData(TableNo: Integer, [RunTrigger: Boolean])
```
## Parameters
*TableNo*  
&emsp;Type: [Integer](integer-data-type.md)  
  
*RunTrigger*  
&emsp;Type: [Boolean](boolean-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
You use this method as part of the upgrade code for an extension, where it is called from the `OnNavAppUpgradePerDatabase()` or `OnNavAppUpgradePerCompany()` system methods. When an extension is uninstalled, the data in application tables of the extension is automatically stored into a set of special tables so that the data is still preserved. With the RESTOREARCHIVEDATA method, you can restore the archived data to the application table of the new version of an extension when it is installed. 

## See Also
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)