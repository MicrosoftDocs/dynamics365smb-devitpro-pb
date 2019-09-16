---
title: "GetBySystemId Method"
ms.author: solsen
ms.custom: na
ms.date: 09/16/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# GetBySystemId Method
Gets a record by its SystemId.


## Syntax
```
[RecordExists := ]  Record.GetBySystemId(SystemId: Guid)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*SystemId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The SystemId of the record to retrieve.  


## Return Value
*RecordExists*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the record exists; otherwise **false**.If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  