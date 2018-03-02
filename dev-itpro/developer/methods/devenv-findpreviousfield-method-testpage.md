---
title: "FINDPREVIOUSFIELD Method (TestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 823ddfbe-8ca9-4e1c-9f75-de5e46574997
caps.latest.revision: 5
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FINDPREVIOUSFIELD Method (TestPage)
Finds the previous field in the dataset that is displayed on a test page.  
  
## Syntax  
  
```  
[Ok :=] TestPage.FINDPREVIOUSFIELD(Field, Value);  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page that contains the dataset.  
  
 *Field*  
 Type: Field  
  
 The field to find.  
  
 *Value*  
 Type: Any  
  
 The value of the field.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the previous field is found; otherwise, **false**. The return value is optional.  
  
## See Also  
 [TestPage Methods](devenv-TestPage-Methods.md)