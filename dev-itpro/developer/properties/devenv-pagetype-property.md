---
title: "PageType Property"
description: "Sets the type of page to create."
ms.author: solsen
ms.custom: na
ms.date: 12/08/2022
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

|Value|CompatibilityInfo|Description|
|-----------|-----------|---------------------------------------|
|**Card**|Available or changed with runtime version 1.0.|Master, reference, and set up data management.|
|**List**|Available or changed with runtime version 1.0.|Entity overviews and navigation, and inline editing of simple entities.|
|**RoleCenter**|Available or changed with runtime version 1.0.|Overview of business performance and the start page for a specific user profile.|
|**CardPart**|Available or changed with runtime version 1.0.|A page that is embedded in another page, such as in a FactBox.|
|**ListPart**|Available or changed with runtime version 1.0.|A page that is embedded in another page, such as in a FactBox.|
|**Document**|Available or changed with runtime version 1.0.|Transaction and other document management.|
|**Worksheet**|Available or changed with runtime version 1.0.|Line-based data entry tasks (such as journals) and inquiries.|
|**ListPlus**|Available or changed with runtime version 1.0.|Statistics, details, and related data management.|
|**ConfirmationDialog**|Available or changed with runtime version 1.0.|Confirmative or exceptional dialog, such as warnings.|
|**NavigatePage**|Available or changed with runtime version 1.0.|Multi-step dialog (also known as a "Wizard").|
|**StandardDialog**|Available or changed with runtime version 1.0.|Routine dialog that starts or progresses a task.|
|**API**|Available or changed with runtime version 1.0.|Pages of this type are used to generate web service endpoints and cannot be shown in the user interface.|
|**ReportPreview**|Available or changed with runtime version 1.0.|Preview of a report.|
|**ReportProcessingOnly**|Available or changed with runtime version 1.0.|Only report processing.|
|**XmlPort**|Available or changed with runtime version 1.0.|XmlPort page.|
|**HeadlinePart**|Available or changed with runtime version 1.0.|A page that is embedded in a `RoleCenter` page to display relevant insights from across the business.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
PageType = List;
```

## Remarks  

You typically set this property when you are create new pages, but you can change it at any time. The value for the **PageType** property specifies the Page layout.

The exception is the value *API*. Pages of this type are used to generate web service endpoints and cannot be shown in the user interface. For an overview of supported page types, see [Pages Overview](../devenv-pages-overview.md).

## See Also  

[Page Properties](./devenv-properties.md)  
[Properties](devenv-properties.md)  
[Pages Overview](../devenv-pages-overview.md)