---
title: "OnLookup (Fields) Trigger"
ms.custom: na
ms.date: 05/10/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# OnLookup (Fields) Trigger
Causes the system to display a lookup page.  
  
## Applies To  
 Fields  
  
## Remarks  
 There are three lookup options:  
  
1.  Default Lookup - The lookup into the table is performed without applying filters or other special parameters.  
  
2.  Field Lookup - You can use this trigger to define a field lookup that will be used in place of the default lookup.  
  
3.  Text box Lookup - You can use the [OnLookup \(Page fields\) Trigger](OnLookup--Page-fields--Trigger.md) to define a lookup based on the value of a text box. This value will be used in place of the default lookup or the field lookup.  
  
 When using this trigger, follow this approach:  
  
-   Use the field value to determine what filters or other parameters to apply.  
  
-   Run the lookup page as a modal page.  
  
-   Transfer the value the user selects back to the field when the user chooses **OK**.  
  
 If an error occurs in the trigger code, the lookup page is closed.  
  
> [!IMPORTANT]  
>  On non-editable fields in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the field lookup action is rendered as a hyperlink.
>
> On a non-editable fields in the [!INCLUDE[nav_web](includes/nav_web_md.md)], the OnLookup trigger is not invoked. This means, the lookup will not render in a Repeater control in view mode. In this case, you can use the [OnDrillDown Trigger](OnDrillDown-Trigger.md) instead.   
  
## See Also  
 [OnLookup \(Page fields\) Trigger](OnLookup--Page-fields--Trigger.md)