---
title: "IncludeCaption Property"
description: "Sets whether to include the caption of a field in the data set of a report."
ms.author: solsen
ms.custom: na
ms.date: 05/18/2022
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
# IncludeCaption Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether to include the caption of a field in the data set of a report.

## Applies to
-   Report Column

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  

**True** if the caption is included in the dataset; otherwise **false**. The default value is **false**.  

## Syntax

```AL
IncludeCaption = true;
```

## Remarks  

If you want to use the Caption or CaptionML values of a field as a label on a report layout, then you must include the caption in the dataset. If you do not include the caption in the dataset, then in a multilanguage application, you cannot use the multilanguage captions as labels in the report.  

## See Also  

[Caption Property](devenv-caption-property.md)  