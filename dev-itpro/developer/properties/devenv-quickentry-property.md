---
title: "QuickEntry Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 6d7713f7-4d68-4989-8ed5-4dec80ae7334
caps.latest.revision: 12
author: SusanneWindfeldPedersen
---

# QuickEntry Property

Specifies whether the page field control has input focus when users navigate through fields by pressing the Enter key. 


<!-- 
  
> [!NOTE]  
>  Specifying an expression as the value of the property is not supported.  -->
  
## Applies to
  
Page fields  

<!-- onprem in the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md-md)]-->


## Property Value
 
**true** specifies that the field has input focus when users move through fields by pressing Enter; **false** specifies the field to be skipped. The default is **true**.


> [!NOTE]
> For [!INCLUDE[nav_windows_md](../includes/nav_windows_md.md)] development, you can use a Boolean variable or a Boolean type field on the page to enable quick entry on a field conditionally. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”. This is currently not supported in the [!INCLUDE[webclient](../includes/webclient.md)]. 

## Remarks  

This property helps accelerate data entry, when using the keyboard, by only focusing on those fields a user typically fills in; skipping those that are rarely filled in. The **QuickEntry** property is respected when users press the Enter key. This behavior differs from using the Tab key, which will sequentially give input focus to all page controls. By using this property, you define a path for entering data, which is beneficial for repetitive data entry tasks.

As a developer, the **QuickEntry** property can also be set by using Designer (see [Using Designer](../devenv-inclient-designer.md)). In the client, users can change the setting for their workspace by using personalization (see [Personalizing Your Workspace](/dynamics365/business-central/ui-personalization-user)).

## Example

This example illustrates how to remove the **Credit Limit (LCY)** field from quick entry.

```
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

## Example

This example illustrates how to dynamically set the **QuickEntry** property in the [!INCLUDE[nav_windows_md](../includes/nav_windows_md.md)] by using a Boolean field on the page. The code modifies the **Customer Card** page so that the **Credit Limit (LCY)** field is skipped if the **Allow Invoice Discount** field is not selected.

```
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
