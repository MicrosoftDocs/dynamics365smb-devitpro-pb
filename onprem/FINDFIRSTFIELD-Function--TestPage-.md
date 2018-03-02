---
title: "FINDFIRSTFIELD Function (TestPage)"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 91c8fec5-7f57-431b-93d1-a238e9249e7b
caps.latest.revision: 7
manager: edupont
---
# FINDFIRSTFIELD Function (TestPage)
Finds the first field in the dataset that is displayed on a test page.  
  
## Syntax  
  
```  
[Ok :=] TestPage.FINDFIRSTFIELD(Field, Value);  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page that contains the dataset that you want to find.  
  
 *Field*  
 Type: Field  
  
 The field to find.  
  
 *Value*  
 Type: Any  
  
 The value of the field.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the first field is found; otherwise, **false**. The return value is optional.  
  
## See Also  
 [TestPage Functions](TestPage-Functions.md)