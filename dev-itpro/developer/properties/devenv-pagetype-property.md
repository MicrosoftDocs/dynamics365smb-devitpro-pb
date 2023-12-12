---
title: "PageType Property"
description: "Sets the type of page to create."
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
# PageType Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the type of page to create.

## Applies to
-   Page

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Card**|runtime version 1.0|Master, reference, and set up data management.|
|**List**|runtime version 1.0|Entity overviews and navigation, and inline editing of simple entities.|
|**RoleCenter**|runtime version 1.0|Overview of business performance and the start page for a specific user profile.|
|**CardPart**|runtime version 1.0|A page that is embedded in another page, such as in a FactBox.|
|**ListPart**|runtime version 1.0|A page that is embedded in another page, such as in a FactBox.|
|**Document**|runtime version 1.0|Transaction and other document management.|
|**Worksheet**|runtime version 1.0|Line-based data entry tasks (such as journals) and inquiries.|
|**ListPlus**|runtime version 1.0|Statistics, details, and related data management.|
|**ConfirmationDialog**|runtime version 1.0|Confirmative or exceptional dialog, such as warnings.|
|**NavigatePage**|runtime version 1.0|Multi-step dialog (also known as a "Wizard").|
|**StandardDialog**|runtime version 1.0|Routine dialog that starts or progresses a task.|
|**API**|runtime version 1.0|Pages of this type are used to generate web service endpoints and cannot be shown in the user interface.|
|**ReportPreview**|runtime version 1.0|Preview of a report.|
|**ReportProcessingOnly**|runtime version 1.0|Only report processing.|
|**XmlPort**|runtime version 1.0|XmlPort page.|
|**HeadlinePart**|runtime version 1.0|A page that is embedded in a `RoleCenter` page to display relevant insights from across the business.|
|**PromptDialog**|runtime version 12.1|Dialog that prompts the user for input and shows the output of a copilot interaction.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
PageType = List;
```

## Remarks  

You typically set this property when you are create new pages, but you can change it at any time. The value for the **PageType** property specifies the Page layout.

The exception is the value *API*. Pages of this type are used to generate web service endpoints and cannot be shown in the user interface. For an overview of supported page types, see [Pages Overview](../devenv-pages-overview.md).

When the **PageType** property is set to **PromptDialog**, you must also set the **PromptMode** property to specify the current mode of the page. For more information, see [PromptMode Property](devenv-promptmode-property.md). For more information about the **PromptDialog** page type, see [PromptDialog page type](../devenv-page-type-promptdialog.md).

## See Also  

[Page Properties](./devenv-properties.md)  
[Properties](devenv-properties.md)  
[Pages Overview](../devenv-pages-overview.md)