---
title: "Promoted (Action) Property"
description: "Sets the value that indicates whether the selected action is elevated to a promoted category in the action bar."
ms.custom: na
ms.date: 07/08/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Promoted (Action) Property
> **Version**: _Available from runtime version 1.0._

Sets the value that indicates whether the selected action is promoted, which means that it is elevated to a promoted category in the action bar, as well as the group where is it defined. **Promoted** can also be set on Profiles, see [Promoted (Profiles) Property](devenv-promoted-profile-property.md).
  
## Applies to  
  
- Page actions  

## Property Value

**true** promotes the action; otherwise **false**.
  
## Example

The following code illustrates how to set the **Promoted** property.
 
```AL
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

For the Promoted property to have an effect, you must also set the [PromotedCategory property](devenv-promotedcategory-property.md).

For more information about promoting actions, see [Promoted Actions](../devenv-promoted-actions.md).

> [!NOTE] 
> On [!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)] and [!INCLUDE[d365fin_phone_md](../includes/d365fin_phone_md.md)], only promoted actions are displayed.  
  
## See Also  

[PromotedIsBig Property](devenv-promotedisbig-property.md)  
[PromotedOnly Property](devenv-promotedonly-property.md)  
[Promoted (Profiles) Property](devenv-promoted-profile-property.md)
[Actions Overview](../devenv-actions-overview.md)  
