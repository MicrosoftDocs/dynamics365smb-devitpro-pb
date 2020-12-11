---
title: "NavApp.GetArchiveRecordRef Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# NavApp.GetArchiveRecordRef Method
> **Version**: _Available from runtime version 1.0 until version 6.0 where it was deprecated for the following reason: "The features related to data migration from V1 to V2 extensions are being deprecated."_

Returns a RecordRef for the specified table.


## Syntax
```
[Ok := ]  NavApp.GetArchiveRecordRef(TableNo: Integer, var RecordRef: RecordRef)
```
## Parameters
*TableNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the table ID.  
*RecordRef*  
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)  
Specifies the reference.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true**, if a record was found; other **false**


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)