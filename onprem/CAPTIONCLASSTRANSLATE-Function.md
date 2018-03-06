---
title: "CAPTIONCLASSTRANSLATE Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e7d75eda-bc70-4400-826e-267d8873a661
caps.latest.revision: 3
manager: edupont
---
# CAPTIONCLASSTRANSLATE Function
Returns a translated version of the caption string. The string is translated to the current local language.  
  
## Syntax  
  
```  
  
String := CAPTIONCLASSTRANSLATE(CaptionClassText)  
```  
  
#### Parameters  
 *CaptionClassText*  
 Type: String  
  
 A literal string that defines the caption.  
  
## Return Value  
 Type: Text  
  
 The caption string in the current local language of the client.  
  
## Remarks  
 You can use the [SELECTLATESTVERSION Function \(Database\)](SELECTLATESTVERSION-Function--Database-.md) to clear the current session's cache for the CaptionClassTranslate strings. The strings will then be reevaluated by the **CaptionClassTranslate** function trigger \(ID 15\) in codeunit 1.  
  
## See Also  
 [CaptionClass Functionality](CaptionClass-Functionality.md)