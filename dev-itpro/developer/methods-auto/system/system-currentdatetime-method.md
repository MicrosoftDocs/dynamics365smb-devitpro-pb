---
title: "System.CurrentDateTime Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# System.CurrentDateTime Method
> **Version**: _Available from runtime version 1.0._

Gets the current DateTime.


## Syntax
```
Datetime :=   System.CurrentDateTime()
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*Datetime*
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

This example requires that you create a DateTime variable named TestDateTime.  
  
```al
TestDateTime := CurrentDateTime;  
Message(Format(TestDateTime));  
```  
  
The message window displays the current date and time.
 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)