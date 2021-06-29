---
title: "Page.Caption Method"
description: "The caption shown in the title bar. For example, the default value in English (United States) is the same as the name of the page."
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
# Page.Caption Method
> **Version**: _Available or changed with runtime version 1.0._

The caption shown in the title bar. For example, the default value in English (United States) is the same as the name of the page.


## Syntax
```
[Caption := ]  Page.Caption([NewCaption: String])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  

*[Optional] NewCaption*  
&emsp;Type: [String](../string/string-data-type.md)  
The new caption text.  


## Return Value
*[Optional] Caption*  
&emsp;Type: [String](../string/string-data-type.md)  
The text used for the caption.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)