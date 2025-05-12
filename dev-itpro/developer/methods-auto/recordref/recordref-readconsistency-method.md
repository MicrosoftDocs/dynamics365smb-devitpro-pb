---
title: "RecordRef.ReadConsistency() Method"
description: "Gets a value indicating whether read consistency is enabled."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.ReadConsistency() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a value indicating whether read consistency is enabled.


## Syntax
```AL
Ok :=   RecordRef.ReadConsistency()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if read consistency is enabled; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[RecordRef Data Type](recordref-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)