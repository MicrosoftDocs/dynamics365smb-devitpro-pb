---
title: "TextBuilder.Insert Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# TextBuilder.Insert Method
> **Version**: _Available or changed with runtime version 1.0._

Inserts a string into this TextBuilder instance at the specified character position.


## Syntax
```
[Ok := ]  TextBuilder.Insert(Position: Integer, Text: Text)
```
## Parameters
*TextBuilder*
&emsp;Type: [TextBuilder](textbuilder-data-type.md)
An instance of the [TextBuilder](textbuilder-data-type.md) data type.

*Position*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The position in this TextBuilder instance where insertion begins.
        
*Text*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string to insert.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the insertion of the specified succeeded, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextBuilder Data Type](textbuilder-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)