---
title: "DataTransfer.UpdateAuditFields([Boolean]) Method"
description: "Sets if audit fields should be updated."
ms.author: solsen
ms.custom: na
ms.date: 12/06/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataTransfer.UpdateAuditFields([Boolean]) Method
> **Version**: _Available or changed with runtime version 10.0._

Sets if audit fields should be updated. If the value is set to false, the audit fields are not updated when calling the CopyFields method. Default value is true.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[UpdateAuditFields := ]  DataTransfer.UpdateAuditFields([UpdateAuditFields: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*DataTransfer*  
&emsp;Type: [DataTransfer](datatransfer-data-type.md)  
An instance of the [DataTransfer](datatransfer-data-type.md) data type.  

*[Optional] UpdateAuditFields*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Sets if audit fields should be updated. If the value is set to false, the audit fields are not updated when calling the CopyFields method.  


## Return Value
*[Optional] UpdateAuditFields*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Gets if audit fields should be updated. If the value is set to false, the audit fields are not updated when calling the CopyFields method.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[DataTransfer Data Type](datatransfer-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)