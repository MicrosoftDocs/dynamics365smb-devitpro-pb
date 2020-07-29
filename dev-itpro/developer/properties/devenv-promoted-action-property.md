---
title: "Promoted (Action) Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Promoted (Action) Property
Sets the value that indicates whether the selected action is promoted, which means that it is elevated to a promoted category in the action bar, as well as the group where is it defined. **Promoted** can also be set on Profiles, see [Promoted (Profiles) Property](devenv-promoted-profile-property.md).
  
## Applies to  
  
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

This feature allows you to make a copy of an action and place it on the on the action bar where it is easier to find.  
  
Available options are **true**/**false**.  
  
On [!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)] and [!INCLUDE[d365fin_phone_md](../includes/d365fin_phone_md.md)] only promoted actions are displayed.  
  
## See Also  
[PromotedIsBig Property](devenv-promotedisbig-property.md)  
[PromotedOnly Property](devenv-promotedonly-property.md)  
[Promoted (Profiles) Property](devenv-promoted-profile-property.md)
[Actions Overview](../devenv-actions-overview.md)  
