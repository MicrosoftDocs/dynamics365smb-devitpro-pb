---
title: "TEMPORARYPATH Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d770619b-4250-46d3-a602-5cef7334df6b
caps.latest.revision: 6
manager: edupont
---
# TEMPORARYPATH Function
Gets the path of the directory where the temporary file for [!INCLUDE[navnow](includes/navnow_md.md)] is stored.  
  
## Syntax  
  
```  
  
TEMPORARYPATH  
```  
  
## Remarks  
 This function returns a string that contains the path of the directory where the temporary file for [!INCLUDE[navnow](includes/navnow_md.md)] is stored. This string ends with a backslash \('\\'\) and does not contain the name of the temp file.  
  
 The string cannot contain more than 255 characters.  
  
 If this function is called from an application that is running on a [!INCLUDE[navnow](includes/navnow_md.md)] Application Server, it returns the path of the directory where the [!INCLUDE[navnow](includes/navnow_md.md)] Application Server is installed.  
  
## See Also  
 [APPLICATIONPATH Function](APPLICATIONPATH-Function.md)   
 [GUIALLOWED Function](GUIALLOWED-Function.md)   
 [HYPERLINK Function](HYPERLINK-Function.md)   
 [SLEEP Function](SLEEP-Function.md)