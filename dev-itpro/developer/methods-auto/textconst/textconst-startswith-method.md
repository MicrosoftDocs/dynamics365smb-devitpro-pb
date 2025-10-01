---
title: "TextConst.StartsWith(Text) Method"
description: "Determines whether the beginning of this instance matches a specified string."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TextConst.StartsWith(Text) Method
> **Version**: _Available or changed with runtime version 15.1._

Determines whether the beginning of this instance matches a specified string.


## Syntax
```AL
Ok :=   TextConst.StartsWith(Value: Text)
```
## Parameters
*TextConst*  
&emsp;Type: [TextConst](textconst-data-type.md)  
An instance of the [TextConst](textconst-data-type.md) data type.  

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string to compare.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the beginning of this instance matches the specified string, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextConst data type](textconst-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)