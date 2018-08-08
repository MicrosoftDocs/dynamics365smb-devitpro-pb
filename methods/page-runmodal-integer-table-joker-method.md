---
title: "RunModal Method"
ms.author: solsen
ms.custom: na
ms.date: 08/07/2018
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
# RunModal Method
Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.

## Syntax
```
[Action := ]  Page.RunModal(Number: Integer, [Record: Table], [Field: Any])
```
## Parameters
*Number*  
&emsp;Type: [Integer](integer-data-type.md)  
  
*Record*  
&emsp;Type: [Table](table-data-type.md)  
  
*Field*  
&emsp;Type: [Any](any-data-type.md)  
  


## Return Value
*Action*  
&emsp;Type: [Action](action-option.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)