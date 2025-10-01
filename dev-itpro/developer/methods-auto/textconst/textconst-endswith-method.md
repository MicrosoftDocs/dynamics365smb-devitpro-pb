---
title: "TextConst.EndsWith(Text) Method"
description: "Determines whether the end of this string instance matches the specified string."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TextConst.EndsWith(Text) Method
> **Version**: _Available or changed with runtime version 15.1._

Determines whether the end of this string instance matches the specified string.


## Syntax
```AL
Ok :=   TextConst.EndsWith(Value: Text)
```
## Parameters
*TextConst*  
&emsp;Type: [TextConst](textconst-data-type.md)  
An instance of the [TextConst](textconst-data-type.md) data type.  

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string to compare to the substring at the end of this instance.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the end of this string instance matches the specified string, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextConst data type](textconst-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)