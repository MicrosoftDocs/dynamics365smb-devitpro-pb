---
title: "Promoted Property"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: be3af957-fdba-42ed-8630-a75031303f8a
caps.latest.revision: 14
author: SusanneWindfeldPedersen
---

# Promoted Property
Sets the value that indicates whether the selected action is promoted, which means that it appears on the Home tab as well as the tab where is it defined.  
  
## Applies To  
  
- Page actions  
  
## Example
The following code illustrates how to set the **Promoted** property.
 
```
page 50110 PageName
{
    PageType = Card;

    actions
    {
        // Adds the action called "My Actions" to the Action menu 
        area(Processing)
        {
            action("My Actions")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

...
```

## Remarks  
This feature allows you to make a copy of an action and place it on the Home tab so that it is easier to find.  
  
Available options are **true**/**false**.  
  
On [!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)] and [!INCLUDE[d365fin_phone_md](../includes/d365fin_phone_md.md)] only promoted actions are displayed.  
  
## See Also  
[PromotedIsBig Property](devenv-promotedisbig-property.md)   
[PromotedOnly Property](devenv-promotedonly-property.md)  
[Actions Overview](../devenv-actions-overview.md)  
