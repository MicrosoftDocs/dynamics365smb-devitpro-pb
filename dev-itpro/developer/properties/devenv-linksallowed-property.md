---
title: "LinksAllowed Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 854fb973-9df4-4b97-9e94-67d2509143d6
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

 

# LinksAllowed Property
Sets whether links are allowed.  
  
## Applies to  
  
-   Pages  
  
## Property Value  
 **True** if links are allowed; otherwise, **false**. The default value is **true**.  

## Syntax
```
LinksAllowed = false;
```  
## Remarks  
 If LinksAllowed is set to **true**, then you can add links or notes to a page. The links can be a links to web sites, files stored on the local computer or on a remote computer, or links to pages.  
  
 On a page, the links and notes are displayed in FactBoxes. If LinksAllowed is set to **true**, then the **Actions** menu has a **Notes** item and a **Links** item. You use these to create and modify notes and links.  
  
## See Also  
 [Properties](devenv-properties.md)