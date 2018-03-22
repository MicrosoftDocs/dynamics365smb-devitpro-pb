---
title: "TEMPORARYPATH Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d770619b-4250-46d3-a602-5cef7334df6b
caps.latest.revision: 6
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# TEMPORARYPATH Method
Gets the path of the directory where the temporary file for [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] is stored.  
  
## Syntax  
  
```  
  
TEMPORARYPATH  
```  
  
## Remarks  
 This method returns a string that contains the path of the directory where the temporary file for [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] is stored. This string ends with a backslash \('\\'\) and does not contain the name of the temp file.  
  
 The string cannot contain more than 255 characters.  
  
 If this method is called from an application that is running on a [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] Application Server, it returns the path of the directory where the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] Application Server is installed.  
  
## See Also  
 [APPLICATIONPATH Method](devenv-APPLICATIONPATH-Method.md)   
 [GUIALLOWED Method](devenv-GUIALLOWED-Method.md)   
 [HYPERLINK Method](devenv-HYPERLINK-Method.md)   
 [SLEEP Method](devenv-SLEEP-Method.md)