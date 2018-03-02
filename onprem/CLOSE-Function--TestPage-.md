---
title: "CLOSE Function (TestPage)"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: dd7af6bb-ad6b-4611-bdc0-fb532cdc977a
caps.latest.revision: 9
manager: edupont
---
# CLOSE Function (TestPage)
Closes an open test page.  
  
## Syntax  
  
```  
  
TestPage.CLOSE  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page that you want to close.  
  
## Remarks  
 If *TestPage* has never been opened or is already closed, then a run-time error occurs, and the outcome of the test function is FAILURE.  
  
## Example  
 This example requires that you create a TestPage variable named CustTestPage with a Subtype of Customer List and that the codeunit in which you write the code is a test codeunit.  
  
```  
// Open the test page.  
CustPage.OPENEDIT;  
// Add code to test the Customer List page.  
// …  
// Close the Customer Card   
CustPage.CLOSE;  
```  
  
## See Also  
 [TestPage Functions](TestPage-Functions.md)