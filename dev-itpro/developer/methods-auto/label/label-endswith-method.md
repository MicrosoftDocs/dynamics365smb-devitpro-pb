---
title: "Label.EndsWith(Text) Method"
description: "Determines whether the end of this string instance matches the specified string."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.EndsWith(Text) Method
> **Version**: _Available or changed with runtime version 15.0._

Determines whether the end of this string instance matches the specified string.


## Syntax
```AL
Ok :=   Label.EndsWith(Value: Text)
```
## Parameters
*Label*  
&emsp;Type: [Label](label-data-type.md)  
An instance of the [Label](label-data-type.md) data type.  

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string to compare to the substring at the end of this instance.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the end of this string instance matches the specified string, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)