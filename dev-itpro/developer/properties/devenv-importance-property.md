---
title: "Importance Property"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Importance Property

Specifies how a field appears on the FastTab of a page when the FastTab is expanded and collapsed.
  
## Applies To  
 Page Fields  

## Property Values  
  
|Value|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|**Standard**|Displays the field on the page by default. This is the default value.|  
|**Promoted**|Displays the field on the page and also in the header of the FastTab when the FastTab is collapsed.|  
|**Additional**|Hides the field by default. On a FastTab, to show the field, a user can choose **Show more** to display the field.|  
  
## Remarks

You use this property to control the amount of information that is visible on a page. It is useful on pages that have a large number of fields, where you can display the most important fields by default, but users have the option to show more as needed.  

In he client, users can 
You can set the **Importance** property if you are an administrator or as a user personalization option. 


  
## See Also  
 [Properties](devenv-properties.md)