---
title: "Importance Property"
description: "Sets the amount of information that is visible in a window or dialog box."
ms.author: solsen
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Importance Property
> **Version**: _Available or changed with runtime version 3.2._

Sets the amount of information that is visible in a window or dialog box.

## Applies to
-   Page Label
-   Page Field

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Standard**|runtime version 3.2|Displays the field on the page by default.|
|**Promoted**|runtime version 3.2|Displays the field on the page and also in the header of the FastTab when the FastTab is collapsed.|
|**Additional**|runtime version 3.2|Hides the field by default. On a FastTab, to show the field, a user can choose **Show more** to display the field.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
Importance = Additional;
```
  
## Remarks

You use this property to control the amount of information that is visible on a page. It is useful on pages that have a large number of fields, where you can display the most important fields by default, but users have the option to show more as needed.  

As a developer, the **Importance** property can also be set also by Use Designer (see [Use Designer](../devenv-inclient-designer.md)). In the client, users can change the setting for their workspace by using personalization (see [Personalizing Your Workspace](/dynamics365/business-central/ui-personalization-user).

> [!NOTE]
> In version 24 (runtime 14) and earlier, the **Important** property is ignored on `StandardDialog` and `ConfirmationDialog` page types. This behavior means that a field can't be hidden under the **Show more** action even if the user tries to do so using personlaization or designer. The field also can't be promoted in the FastTab when it's collapsed. However, starting from version 25 (runtime 15), the property is fully respected in the client so it behaves like any other page type. As a result, after upgrading to version 25, users might have a slightly different experience on some Dialog and Confirmation page types.

## See Also

[Properties](devenv-properties.md)