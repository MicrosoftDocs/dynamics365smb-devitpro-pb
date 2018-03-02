---
title: "OnLookup (Page fields) Trigger"
ms.custom: na
ms.date: 05/10/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# OnLookup (Page fields) Trigger
Executed in place of the normal lookup features for the current page.  
  
## Syntax  
  
```  
  
OnLookup(TextString)  
```  
  
#### Parameters  
 *TextString*  
  
 Text string entered into the text box and used as the lookup value.  
  
## Applies To  
 Fields on pages  
  
## Remarks  
 There are three lookup options:  
  
-   Default Lookup - The lookup into the table is performed without applying filters or other special parameters.  
  
-   Field Lookup - You can define a lookup trigger on a field that will be used in place of the default lookup. For more information, see [OnLookup \(Fields\) Trigger](OnLookup--Fields--Trigger.md).  
  
-   Text box Lookup - You can use this trigger to define a lookup based on the value of a text box. This value will be used in place of the default lookup or the field lookup.  
  
 For example, for the Customer Code field, a lookup into the Customer table is provided. If you want a lookup into another table or if you want to place a filter on the table before displaying the lookup, use this trigger.  
  
 If an error occurs in the trigger code, the lookup is canceled.  
  
 You can use this trigger to write to the database.  
  
> [!NOTE]  
>  **OnLookup** is also a field trigger at the table level. The flow is different for this trigger. When a lookup is requested, the page field's OnLookup trigger is executed if it is defined in the field lookup or system default. If no control lookup trigger is defined, the [OnLookup \(Fields\) Trigger](OnLookup--Fields--Trigger.md) \(if defined\) replaces the system default lookup function. 

> [!IMPORTANT]  
> On non-editable fields in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the field lookup action is rendered as a hyperlink.
>
> On non-editable fields in the [!INCLUDE[nav_web](includes/nav_web_md.md)], the OnLookup trigger is not invoked. This means, the lookup will not render in a Repeater control in view mode. In this case, you can use the [OnDrillDown Trigger](OnDrillDown-Trigger.md) instead.   
  
## See Also  
 [Triggers](Triggers.md)