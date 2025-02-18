---
title: "Label.Contains(Text) Method"
description: "Returns a value indicating whether a specified substring occurs within this string."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.Contains(Text) Method
> **Version**: _Available or changed with runtime version 15.0._

Returns a value indicating whether a specified substring occurs within this string.


## Syntax
```AL
Ok :=   Label.Contains(Value: Text)
```
## Parameters
*Label*  
&emsp;Type: [Label](label-data-type.md)  
An instance of the [Label](label-data-type.md) data type.  

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string to seek.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the specified substring occurs in the  specified string, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)