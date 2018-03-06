---
title: "Visible Property"
author: edupont04
ms.custom: na
ms.date: 12/08/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 729f3649-f7c8-498d-8c16-961771f192a0
ms.author: edupont
---
# Visible Property
Sets whether to display the page or control.  

## Applies To  

-   Page fields and action controls

-   Group and part controls on pages  

-   FactBoxes  

## Property Value  
 **Yes** \(**true** on pages\) if you want the page or control to be visible; otherwise, **No** \(**false** on pages\). The default is **Yes** \(**true** on pages\).  

## Remarks  
 Because this property also applies to containers, such as pages and subpages, if the **Visible** property for the container is set to **No**, then controls on the container are also not displayed, even if the **Visible** property is set to **Yes**.  

 On pages, you use the **Visible** property to show or hide group, part, field, and action controls. You can show or hide the control either statically by setting the property to **true** or **false**, or dynamically by using a Boolean variable or a Boolean field on the page. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”.  

> [!NOTE]  
>  The dynamic options are only possible for group and part controls.  

 Using a variable for field and action controls requires that the variable be resolved by the [OnInit Trigger](OnInit-Trigger.md) or [OnOpenPage Trigger](OnOpenPage-Trigger.md).  

## Example: Dynamic Property Change Using a Boolean Field  
 To hide all payment fields on a customer card when line discounts are allowed, follow these steps:  

1.  Open page 21, **Customer Card**, with Page Designer.  

2.  View the properties of the group named Payments, which represents the **Payments** FastTab.  

3.  For the **Visible** property, enter **NOT “Allow Line Disc.”** in the **Value** field.  

     The **Allow Line Disc.** field is a Boolean field on page 21, **Customer Card**.  

4.  Save the changes on page 21.  

 Now, when a user selects the **Allow Line Disc.** check box on a customer card, the **Payments** FastTab is not visible. Otherwise, the FastTab is visible.  

## See Also  
 [Properties](Properties.md)
