---
title: "CAPTIONCLASSTRANSLATE Method"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e7d75eda-bc70-4400-826e-267d8873a661
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CAPTIONCLASSTRANSLATE Method
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
 You can use the [SELECTLATESTVERSION Method \(Database\)](devenv-selectlatestversion-method-database.md) to clear the current session's cache for the CaptionClassTranslate strings. The strings will then be reevaluated by the **CaptionClassTranslate** method trigger \(ID 15\) in codeunit 1.  
<!--  
## See Also  
 [CaptionClass Functionality](captionclass-functionality.md)
 -->