---
title: "QuickEntry Property"
ms.custom: na
ms.date: 10/01/2018
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
  
> [!NOTE]  
>  Specifying an expression as the value of the property is not supported.  
  
## Applies To
  
Page fields  

<!-- onprem in the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md-md)]-->.


## Property Value
 
**true** specifies that the field has input focus when users move through fields by pressing Enter; **false** specifies the field to be skipped The default is **true** on pages.

The property can be configured statically by setting the value to **true** or **false**, or dynamically by using a Boolean variable or a Boolean field on the page. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”.  

## Remarks  

This property helps accelerate data entry, when using the keyboard, by only focusing on those fields a user typically fills in; skipping those that are rarely filled in. The **QuickEntry** property is respected when users press the Enter key. This behavior differs from using the Tab key, which will sequentially give input focus to all page controls. By using this property you define a path for entering data, which is be beneficial for repetitive data entry tasks.

  
## Example

This example illustrates how to dynamically set the **QuickEntry** property by using a Boolean field on the page. The code modifies the **Customer Card** page so that the **Credit Limit (LCY)** field is skipped if the **Allow Invoice Discount** field is not selected.

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
Now, when a user enables **Allow Invoice Disc.** on the customer card, the **Credit Limit (LCY)** field receives focus when the user presses Enter to move focus to the field. Otherwise, focus skips over the field when the user presses Enter to move across the customer card.

## See Also
  
 [Properties](devenv-properties.md)