---
title: "Importance Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Importance Property

Specifies how a field appears on the FastTab of a page when the FastTab is expanded and collapsed.
  
## Applies to  
 Page Fields  

## Property Values  
  
|Value|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|**Standard**|Displays the field on the page by default. This is the default value.|  
|**Promoted**|Displays the field on the page and also in the header of the FastTab when the FastTab is collapsed.<br /><br /> If there is only one FastTab on the page, then this property has no effect because the FastTab cannot be collapsed.|  
|**Additional**|Hides the field by default. On a FastTab, to show the field, a user can choose **Show more** to display the field.|  

## Syntax
```
Importance = Additional;
```
  
## Remarks

You use this property to control the amount of information that is visible on a page. It is useful on pages that have a large number of fields, where you can display the most important fields by default, but users have the option to show more as needed.  

As a developer, the **Importance** property can also be set also by using Designer (see [Using Designer](../devenv-inclient-designer.md)). In the client, users can change the setting for their workspace by using personalization (see [Personalizing Your Workspace](/dynamics365/business-central/ui-personalization-user).

## See Also

 [Properties](devenv-properties.md)