---
title: "PromptMode Property"
description: "Specifies the current mode of a PromptDialog page."
ms.author: solsen
ms.date: 08/15/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PromptMode Property
> **Version**: _Available or changed with runtime version 12.1._

Specifies the current mode of a PromptDialog page.

## Applies to
-   Page

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Content**|runtime version 12.1|Showing the output of the copilot interaction.|
|**Generate**|runtime version 12.1|Generating the output of the copilot interaction.|
|**Prompt**|runtime version 12.1|Prompting the user for input for the copilot interaction.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `PromptMode` property is used on pages that have the [PageType Property](devenv-pagetype-property.md) set to `PromptDialog`. The `PromptDialog` enables creating a generative AI dialog in [!INCLUDE [prod_short](../includes/prod_short.md)]. The default value is `Prompt`, which is the starting prompt mode. The `PromptMode` property can be changed at runtime. The other options are `Generate`, which triggers generating the output of the copilot interaction, and `Content`, which shows the output of the copilot interaction. You can programmatically set this property by setting the variable `CurrPage.PromptMode` before the page is opened. For more information, see [PromptDialog page type](../devenv-page-type-promptdialog.md).

## See Also

[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[PromptDialog page type](../devenv-page-type-promptdialog.md)  
[PageType Property](devenv-pagetype-property.md)