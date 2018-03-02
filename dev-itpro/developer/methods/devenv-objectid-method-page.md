---
title: "OBJECTID Method (Page)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d4505771-1e2f-4190-8980-2cebb173b2fc
caps.latest.revision: 6
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# OBJECTID Method (Page)
Returns a string in the "Page xxx" format, where xxx is the caption or ID of the application object.  
  
## Syntax  
  
```  
  
String := Page.OBJECTID([UseCaptions])  
```  
  
#### Parameters  
 *Page*  
 Type: Page  
  
 The page for which you want to get the caption or object ID.  
  
 *UseCaptions*  
 Type: Boolean  
  
 Set this parameter to **true** if you want the returned string to contain the caption of the page. Set this parameter to **false** if you want the returned string to contain the page ID.  
  
 The default value is **true**.  
  
## Property Value/Return Value  
 Type: Text or code  
  
 The string: Page \<*Page name &#124; Page ID*>  
  
## Example  
 If you add the following code to a page method or trigger, then the returned string is displayed in a message window.  
  
```  
MESSAGE(CurrPage.OBJECTID(TRUE));  
  
```
