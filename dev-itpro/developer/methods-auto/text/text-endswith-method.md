---
title: "Text.EndsWith Method"
description: "Determines whether the end of this string instance matches the specified string."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# Text.EndsWith Method
> **Version**: _Available or changed with runtime version 1.0._

Determines whether the end of this string instance matches the specified string.


## Syntax
```
Ok :=   Text.EndsWith(Value: Text)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Text*  
&emsp;Type: [Text](text-data-type.md)  
An instance of the [Text](text-data-type.md) data type.  

*Value*  
&emsp;Type: [Text](text-data-type.md)  
The string to compare to the substring at the end of this instance.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the end of this string instance matches the specified string, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)