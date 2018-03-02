---
title: "GLOBALLANGUAGE Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9a14088c-b930-48d2-9516-e16e5db214c1
caps.latest.revision: 9
manager: edupont
---
# GLOBALLANGUAGE Function
Gets and sets the current global language setting.  
  
## Syntax  
  
```  
  
[LanguageID :=] GLOBALLANGUAGE([NewLanguageID])  
```  
  
#### Parameters  
 *NewLanguageID*  
 Type: Integer  
  
## Property Value/Return Value  
 Type: Integer  
  
## Remarks  
 The LanguageID is a standard Windows language ID. The Windows Language virtual table contains a list of these IDs and the corresponding names and short names.  
  
 For more information, see [Multilanguage Development](Multilanguage-Development.md).  
  
## See Also  
 [WINDOWSLANGUAGE Function](WINDOWSLANGUAGE-Function.md)