---
title: "Visible Property"
author: edupont04
ms.custom: na
ms.date: 06/16/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 729f3649-f7c8-498d-8c16-961771f192a0
ms.author: jswymer
---

 

# Visible Property
Sets whether to display the page or control.  

## Applies To  

-   Page fields and action controls

-   Group and part controls on pages  

-   FactBoxes  

## Property Value  
 **True** on pages if you want the page or control to be visible; otherwise, **false** on pages. The default is **true** on pages.  

## Remarks  
 Because this property also applies to containers, such as pages and subpages, if the **Visible** property for the container is set to **false**, then controls on the container are also not displayed, even if the **Visible** property is set to **true**.  

 On pages, you use the **Visible** property to show or hide group, part, field, and action controls. You can show or hide the control either statically by setting the property to **true** or **false**, or dynamically by using a Boolean variable or a Boolean field on the page. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”.  

> [!NOTE]  
>  The dynamic options are only possible for group and part controls.  

 Using a variable for field and action controls requires that the variable be resolved by the [OnInit Trigger](../triggers/devenv-oninit-trigger.md) or [OnOpenPage Trigger](../triggers/devenv-onopenpage-trigger.md).  

## See Also  
 [Properties](devenv-properties.md)
