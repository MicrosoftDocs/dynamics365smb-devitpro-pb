---
title: "Record.Validate(Any [, Any]) Method"
description: "Calls the OnValidate trigger for the field that you specify."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.Validate(Any [, Any]) Method
> **Version**: _Available or changed with runtime version 1.0._

Calls the OnValidate trigger for the field that you specify.


## Syntax
```AL
 Record.Validate(Field: Any [, NewValue: Any])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
A field together with associated triggers.  

*[Optional] NewValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value to insert into Field.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)