---
title: "GETACTION Function (TestPage)"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 804191c2-2d23-498f-8129-83e293430ab7
caps.latest.revision: 3
manager: edupont
---
# GETACTION Function (TestPage)
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
 [TestPage Functions](TestPage-Functions.md)