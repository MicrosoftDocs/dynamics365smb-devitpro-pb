---
title: "OnLookup (Fields) Trigger"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b81542a2-308f-4ed4-b5c4-9484df43285c
author: SusanneWindfeldPedersen
---


# OnLookup (Fields) Trigger
Causes the system to display a lookup page.  

## Applies To  
 Fields  

## Remarks  
 There are three lookup options:  

1.  Default Lookup - The lookup into the table is performed without applying filters or other special parameters.  

2.  Field Lookup - You can use this trigger to define a field lookup that will be used in place of the default lookup.  

3.  Text box Lookup - You can use the [OnLookup \(Page fields\) Trigger](devenv-onlookup-page-fields-trigger.md) to define a lookup based on the value of a text box. This value will be used in place of the default lookup or the field lookup.  

 When using this trigger, follow this approach:  

-   Use the field value to determine what filters or other parameters to apply.  

-   Run the lookup page as a modal page.  

-   Transfer the value the user selects back to the field when the user chooses **OK**.  

 If an error occurs in the trigger code, the lookup page is closed.  

<!--NAV  
> [!NOTE]  
>  On non-editable fields in the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)], the field gets its lookup action rendered as a hyperlink. In the [!INCLUDE[nav_web](../includes/nav_web_md.md)] the lookup for a non-editable field is not rendered. You can use the [OnDrillDown Trigger](devenv-OnDrillDown-Trigger.md) instead.  
-->
> [!NOTE]  
>  The lookup for a non-editable field is not rendered. You can use the [OnDrillDown Trigger](devenv-ondrilldown-trigger.md) instead.

## See Also  
 [OnLookup (Page fields) Trigger](devenv-onlookup-page-fields-trigger.md)  
 [Triggers](devenv-triggers.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)  