---
title: "Text.Replace Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text.Replace Method
Returns a new Text in which all occurrences of a specified string in the current instance are replaced with another specified string.


## Syntax
```
Result :=   Text.Replace(OldValue: Text, NewValue: Text)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Text*  
&emsp;Type: [Text](text-data-type.md)  
An instance of the [Text](text-data-type.md) data type.  

*OldValue*  
&emsp;Type: [Text](text-data-type.md)  
The string to replace all occurrences of OldValue.
        
*NewValue*  
&emsp;Type: [Text](text-data-type.md)  
The string to be replaced.  


## Return Value
*Result*  
&emsp;Type: [Text](text-data-type.md)  
The end result Text.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)