---
title: "GETVALIDATIONERROR Method (TestPage, TestPage Field)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e2904335-5728-433c-baad-2f5a4ebacc02
caps.latest.revision: 5
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETVALIDATIONERROR Method (TestPage, TestPage Field)
Gets the validation error that occurred on a test page.  
  
## Syntax  
  
```  
OemText := TestPage.GETVALIDATIONERROR(index);  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page that you want to get the validation error from.  
  
 *index*  
 Type: Integer  
  
 The index of the validation error that occurred on the test page.  
  
## Property Value/Return Value  
 Type: Text  
  
 The validation error that occurred on the test page.  
  
## See Also  
 [TestPage Methods](devenv-TestPage-Methods.md)