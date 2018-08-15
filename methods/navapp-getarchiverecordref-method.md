---
title: "GetArchiveRecordRef Method"
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
# GetArchiveRecordRef Method
Returns a RecordRef for the specified table.

## Syntax
```
[Ok := ]  NavApp.GetArchiveRecordRef(TableNo: Integer, var RecordRef: RecordRef)
```
## Parameters
*TableNo*  
&emsp;Type: [Integer](integer-data-type.md)  

            Specifies the table ID.
            
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  

            Specifies the reference.
            


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)