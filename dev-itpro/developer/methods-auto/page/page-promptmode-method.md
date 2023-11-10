---
title: "Page.PromptMode([PromptMode]) Method"
description: "The mode of a PromptDialog page that prompts the user for input and shows the output of a copilot interaction."
ms.author: solsen
ms.custom: na
ms.date: 10/25/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Page.PromptMode([PromptMode]) Method
> **Version**: _Available or changed with runtime version 12.1._

The mode of a PromptDialog page that prompts the user for input and shows the output of a copilot interaction.


## Syntax
```AL
[PromptMode := ]  Page.PromptMode([NewPromptMode: PromptMode])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  

*[Optional] NewPromptMode*  
&emsp;Type: [PromptMode](../promptmode/promptmode-option.md)  
The new prompt mode.  


## Return Value
*[Optional] PromptMode*  
&emsp;Type: [PromptMode](../promptmode/promptmode-option.md)  
The prompt mode used for the page.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method is used when creating a generative AI dialog in [!INCLUDE [prod_short](../includes/prod_short.md)]. For more information, see [The PromptDialog object](../devenv-page-type-promptdialog.md).

## See Also

[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)