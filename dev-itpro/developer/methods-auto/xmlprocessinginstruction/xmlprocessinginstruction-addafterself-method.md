---
title: "XmlProcessingInstruction.AddAfterSelf(Any,...) Method"
description: "Adds the specified content immediately after this node."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlProcessingInstruction.AddAfterSelf(Any,...) Method
> **Version**: _Available or changed with runtime version 1.0._

Adds the specified content immediately after this node.


## Syntax
```AL
[Ok := ]  XmlProcessingInstruction.AddAfterSelf(Content: Any,...)
```
## Parameters
*XmlProcessingInstruction*  
&emsp;Type: [XmlProcessingInstruction](xmlprocessinginstruction-data-type.md)  
An instance of the [XmlProcessingInstruction](xmlprocessinginstruction-data-type.md) data type.  

*Content*  
&emsp;Type: [Any](../any/any-data-type.md)  
The content to add after this node.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[XmlProcessingInstruction Data Type](xmlprocessinginstruction-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)