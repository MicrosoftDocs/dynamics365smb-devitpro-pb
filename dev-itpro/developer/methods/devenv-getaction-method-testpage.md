---
title: "GETACTION Method (TestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 804191c2-2d23-498f-8129-83e293430ab7
caps.latest.revision: 3
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETACTION Method (TestPage)
Gets the action that the test page invokes.  
  
## Syntax  
  
```  
[Action :=] TestPage.GETACTION(id);  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page variable that you use to refer to the test page.  
  
 *id*  
 Type: Integer  
  
 The ID of the action that the test page invokes.  
  
## Property Value/Return Value  
 Type: Text  
  
 The action that the test page invokes. This return value is optional.  
  
## See Also  
 [TestPage Methods](devenv-TestPage-Methods.md)