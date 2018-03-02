---
title: "OPENVIEW Method (TestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 36e2c656-b0f1-44b4-96e2-98109d3ec620
caps.latest.revision: 6
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# OPENVIEW Method (TestPage)
Opens a test page in view mode.  
  
## Syntax  
  
```  
  
TestPage.OPENVIEW  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page variable that you use to refer to the test page.  
  
## Remarks  
 If *TestPage* is already open, then a run-time error occurs, and the outcome of the test method is FAILURE.  
  
 If the page to which *TestPage* refers is a card page, then the data that is loaded on the page is from the first row in the dataset.  
  
## Example  
 This example requires that you create a variable named CustTestPage with a Subtype of Customer List and that the codeunit in which you write the code is a test codeunit.  
  
```  
// Opens the Customer Card on the first Customer in the dataset.  
CustTestPage.OPENVIEW;  
```