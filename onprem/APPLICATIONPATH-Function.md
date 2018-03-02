---
title: "APPLICATIONPATH Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6fb5a2e1-5eb8-44c1-8247-33643182cf22
caps.latest.revision: 6
manager: edupont
---
# APPLICATIONPATH Function
Returns the path of the directory where the executable file for [!INCLUDE[navnow](includes/navnow_md.md)] is installed.  
  
## Syntax  
  
```  
  
APPLICATIONPATH  
```  
  
## Remarks  
 This function returns a string that contains the path of the directory where the executable file for [!INCLUDE[navnow](includes/navnow_md.md)] is installed. This string ends with a backslash \('\\'\) and does not contain the name of the executable file.  
  
 The string cannot contain more than 255 characters.  
  
 If this function is called from an application that is running on a [!INCLUDE[navnow](includes/navnow_md.md)] Application Server, it returns the path of the directory where the [!INCLUDE[navnow](includes/navnow_md.md)] Application Server is installed.  
  
## See Also  
 [GUIALLOWED Function](GUIALLOWED-Function.md)   
 [HYPERLINK Function](HYPERLINK-Function.md)   
 [SLEEP Function](SLEEP-Function.md)   
 [TEMPORARYPATH Function](TEMPORARYPATH-Function.md)