---
title: "TextBuilder.Append Method"
description: "Appends a copy of the specified string to this TextBuilder instance."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# TextBuilder.Append Method
> **Version**: _Available or changed with runtime version 1.0._

Appends a copy of the specified string to this TextBuilder instance.


## Syntax
```
[Ok := ]  TextBuilder.Append(Text: Text)
```
## Parameters
*TextBuilder*  
&emsp;Type: [TextBuilder](textbuilder-data-type.md)  
An instance of the [TextBuilder](textbuilder-data-type.md) data type.

*Text*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text to append.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the copy of the specified string succeeded, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextBuilder Data Type](textbuilder-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)