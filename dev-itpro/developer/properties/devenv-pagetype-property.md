---
title: "PageType Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# PageType Property
> **Version**: _Available from runtime version 1.0._

Sets the type of page to create.

## Applies to
-   Page

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Card**|Master, reference, and set up data management.|
|**List**|Entity overviews and navigation, and inline editing of simple entities.|
|**RoleCenter**|Overview of business performance and the start page for a specific user profile.|
|**CardPart**|A page that is embedded in another page, such as in a FactBox.|
|**ListPart**|A page that is embedded in another page, such as in a FactBox.|
|**Document**|Transaction and other document management.|
|**Worksheet**|Line-based data entry tasks (such as journals) and inquiries.|
|**ListPlus**|Statistics, details, and related data management.|
|**ConfirmationDialog**|Confirmative or exceptional dialog, such as warnings.|
|**NavigatePage**|Multi-step dialog (also known as a "Wizard").|
|**StandardDialog**|Routine dialog that starts or progresses a task.|
|**API**|Pages of this type are used to generate web service endpoints and cannot be shown in the user interface.|
|**ReportPreview**|Preview of a report.|
|**ReportProcessingOnly**|Only report processing.|
|**XmlPort**|XmlPort page.|
|**HeadlinePart**|A page that is embedded in a `RoleCenter` page to display relevant insights from across the business.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
PageType = List;
```

## Remarks  

You typically set this property when you are create new pages, but you can change it at any time. The value for the **PageType** property specifies the Page layout.

The exception is the value *API*. Pages of this type are used to generate web service endpoints and cannot be shown in the user interface. For an overview of supported page types, see [Pages Overview](../devenv-pages-overview.md).

## See Also  

[Page Properties](devenv-page-properties.md)  
[Properties](devenv-properties.md)  
[Pages Overview](../devenv-pages-overview.md)  