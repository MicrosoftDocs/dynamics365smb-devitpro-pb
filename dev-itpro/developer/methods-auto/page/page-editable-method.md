---
title: "Page.Editable([Boolean]) Method"
description: "Gets or sets the default editability of the page."
ms.author: solsen
ms.custom: na
ms.date: 01/03/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Page.Editable([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the default editability of the page.


## Syntax
```AL
[Editable := ]  Page.Editable([NewEditable: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  

*[Optional] NewEditable*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The new default editability of the page.  


## Return Value
*[Optional] Editable*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Indicates the editability of the page.
      


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `CurrPage.Editable` property represents both whether a page is editable at all and whether the page is currently in edit mode. Dynamic changes to the page Editable property are not supported, except through `CurrPage.Editable(false)` in the `OnOpenPage` trigger.

## See Also
[Page Data Type](page-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)