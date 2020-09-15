---
title: "Page.Caption Method"
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
# Page.Caption Method
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

*NewCaption*  
&emsp;Type: [String](../string/string-data-type.md)  
The new caption text.  


## Return Value
*Caption*  
&emsp;Type: [String](../string/string-data-type.md)  
The text used for the caption.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)