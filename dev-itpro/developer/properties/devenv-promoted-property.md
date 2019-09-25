---
title: "Promoted Property"
ms.custom: na
ms.date: 04/01/2019
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
Sets the value that indicates whether the selected action is promoted, which means that it is elevated to a promoted category in the action bar, as well as the group where is it defined. For profiles the **Promoted** property specifies whether or not the profile is available in the **Role Explorer**.
  
## Applies To  
  
- Page actions  
- Profiles
  
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

This feature allows you to make a copy of an action and place it on the on the action bar where it is easier to find.  
  
Available options are **true**/**false**.  
  
On [!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)] and [!INCLUDE[d365fin_phone_md](../includes/d365fin_phone_md.md)] only promoted actions are displayed.  
  
## See Also  
[PromotedIsBig Property](devenv-promotedisbig-property.md)   
[PromotedOnly Property](devenv-promotedonly-property.md)  
[Actions Overview](../devenv-actions-overview.md)  
