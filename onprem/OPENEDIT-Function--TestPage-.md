---
title: "OPENEDIT Function (TestPage)"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b7d582ab-70fe-40ea-81e7-4261f3882b12
caps.latest.revision: 8
manager: edupont
---
# OPENEDIT Function (TestPage)
Opens a test page in edit mode.  
  
## Syntax  
  
```  
  
TestPage.OPENEDIT  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page variable that you use to refer to the test page.  
  
## Remarks  
 If *TestPage* is already open, then a run-time error occurs, and the outcome of the test function is FAILURE.  
  
 If the page to which *TestPage* refers is a card page, then the data that is loaded on the page is from the first row in the dataset.  
  
## Example  
 This example requires that you create a TestPage variable named CustTestPage with a Subtype of Customer List and that the codeunit in which you write the code is a test codeunit.  
  
```  
// Opens the TestPage in edit mode.  
CustTestPage.OPENEDIT()  
  
```