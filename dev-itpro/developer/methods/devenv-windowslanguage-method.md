---
title: "WINDOWSLANGUAGE Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 07ed58f1-0fa9-47c4-97ef-10ebc52d4fe9
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# WINDOWSLANGUAGE Method
Gets the current Windows language setting.  
  
## Syntax  
  
```  
  
LanguageID := WINDOWSLANGUAGE  
```  
  
## Property Value/Return Value  
 Type: Integer  
  
## Remarks  
 The *LanguageID* is a standard Windows language ID. The Windows Language virtual table contains a list of these IDs and the corresponding names and short names.  
  
 For more information, see [Multilanguage Development](../devenv-multilanguage-development.md).  
  
## See Also  
 [GLOBALLANGUAGE Method](devenv-GLOBALLANGUAGE-Method.md)