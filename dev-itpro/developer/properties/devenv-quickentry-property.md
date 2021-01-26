---
title: "QuickEntry Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# QuickEntry Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies if the page control should have input focus. The default value of the property is true. To specify that a control can be skipped, change this value to false.

Specifying an expression as the value of the property is not supported.

## Applies to
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value
 
**true** specifies that the field has input focus when users move through fields by pressing Enter; **false** specifies the field to be skipped. The default is **true**.


> [!NOTE]  
> For [!INCLUDE[nav_windows_md](../includes/nav_windows_md.md)] development, you can use a Boolean variable or a Boolean type field on the page to enable quick entry on a field conditionally. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as "Credit Limit > Sales YTD". This is currently not supported in the [!INCLUDE[webclient](../includes/webclient.md)]. 

## Remarks  

This property helps accelerate data entry, when using the keyboard, by only focusing on those fields a user typically fills in; skipping those that are rarely filled in. The **QuickEntry** property is respected when users press the Enter key. This behavior differs from using the Tab key, which will sequentially give input focus to all page controls. By using this property, you define a path for entering data, which is beneficial for repetitive data entry tasks.

As a developer, the **QuickEntry** property can also be set by using Designer (see [Using Designer](../devenv-inclient-designer.md)). In the client, users can change the setting for their workspace by using personalization (see [Personalizing Your Workspace](/dynamics365/business-central/ui-personalization-user)).

## Example 1

This example illustrates how to remove the **Credit Limit (LCY)** field from quick entry.

```AL
pageextension 50100 CustomerCardExt extends "Customer Card"
{
    layout
    {
        modify("Credit Limit (LCY)")
        {
            QuickEntry = false;
        }

    }
```

## Example 2

This example illustrates how to dynamically set the **QuickEntry** property in the [!INCLUDE[nav_windows_md](../includes/nav_windows_md.md)] by using a Boolean field on the page. The code modifies the **Customer Card** page so that the **Credit Limit (LCY)** field is skipped if the **Allow Invoice Discount** field is not selected.

```AL
pageextension 50100 CustomerCardExt extends "Customer Card"
{
    layout
    {
        modify("Credit Limit (LCY)")
        {
            QuickEntry = "Allow Line Disc.";
        }

    }
```

Now, when a user enables **Allow Invoice Disc.** on the customer card, the **Credit Limit (LCY)** field gets focus when the user presses Enter. Without this modification, focus skips over the field when the user presses Enter.


## See Also
  
[Properties](devenv-properties.md)