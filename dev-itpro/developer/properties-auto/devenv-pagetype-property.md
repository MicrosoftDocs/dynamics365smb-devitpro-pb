---
title: "PageType Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
Sets the type of page to create.

## Applies to
-   Page

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|Card|TODO:Add documentation|
|List|TODO:Add documentation|
|RoleCenter|TODO:Add documentation|
|CardPart|TODO:Add documentation|
|ListPart|TODO:Add documentation|
|Document|TODO:Add documentation|
|Worksheet|TODO:Add documentation|
|ListPlus|TODO:Add documentation|
|ConfirmationDialog|TODO:Add documentation|
|NavigatePage|TODO:Add documentation|
|StandardDialog|TODO:Add documentation|
|API|TODO:Add documentation|
|ReportPreview|TODO:Add documentation|
|ReportProcessingOnly|TODO:Add documentation|
|XmlPort|TODO:Add documentation|
|HeadlinePart|TODO:Add documentation|
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