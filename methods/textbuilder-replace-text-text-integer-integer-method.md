---
title: "Replace Method"
ms.author: solsen
ms.custom: na
ms.date: 09/28/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Replace Method
Replaces, within a substring of this instance, all occurrences of a specified string in this TextBuilder instance with another specified string.

## Syntax
```
[Ok := ]  TextBuilder.Replace(OldText: Text, NewText: Text, StartIndex: Integer, Count: Integer)
```
## Parameters
*TextBuilder*  
&emsp;Type: [TextBuilder](textbuilder-data-type.md)  
An instance of the [TextBuilder](textbuilder-data-type.md) data type.  

*OldText*  
&emsp;Type: [Text](text-data-type.md)  
The string to replace.
        
*NewText*  
&emsp;Type: [Text](text-data-type.md)  
The string that replaces OldText.
        
*StartIndex*  
&emsp;Type: [Integer](integer-data-type.md)  
The position in this TextBuilder instance where the substring begins.
        
*Count*  
&emsp;Type: [Integer](integer-data-type.md)  
The length of the substring.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if all occurrences of a specified string were succesfully replaced, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextBuilder Data Type](textbuilder-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)