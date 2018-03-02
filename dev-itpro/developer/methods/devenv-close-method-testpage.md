---
title: "CLOSE Method (TestPage)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: dd7af6bb-ad6b-4611-bdc0-fb532cdc977a
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CLOSE Method (TestPage)
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
 If *TestPage* has never been opened or is already closed, then a run-time error occurs, and the outcome of the test method is FAILURE.  
  
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
 [TestPage Methods](devenv-TestPage-Methods.md)