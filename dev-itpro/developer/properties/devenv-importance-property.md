---
title: "Importance Property"
ms.author: solsen
ms.custom: na
ms.date: 01/18/2021
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
# Importance Property
> **Version**: _Available from runtime version 3.2._

Sets the amount of information that is visible in a window or dialog box.

## Applies to
-   Page Label
-   Page Field

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Standard**|Displays the field on the page by default.|
|**Promoted**|Displays the field on the page and also in the header of the FastTab when the FastTab is collapsed.|
|**Additional**|Hides the field by default. On a FastTab, to show the field, a user can choose **Show more** to display the field.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
Importance = Additional;
```
  
## Remarks

You use this property to control the amount of information that is visible on a page. It is useful on pages that have a large number of fields, where you can display the most important fields by default, but users have the option to show more as needed.  

As a developer, the **Importance** property can also be set also by using Designer (see [Using Designer](../devenv-inclient-designer.md)). In the client, users can change the setting for their workspace by using personalization (see [Personalizing Your Workspace](/dynamics365/business-central/ui-personalization-user).

## See Also

[Properties](devenv-properties.md)