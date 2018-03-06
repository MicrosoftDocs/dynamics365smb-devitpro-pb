---
title: "TRAP Function (TestPage)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 528267ed-aa77-4971-b7e2-e4d93ae44842
caps.latest.revision: 8
manager: edupont
---
# TRAP Function (TestPage)
Traps the next test page that is invoked and assigns it to the test page variable.  
  
## Syntax  
  
```  
  
TestPage.TRAP  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page variable that you use to refer to the test page.  
  
## Remarks  
 You can trap only nonmodal pages with the TRAP function. To trap modal pages that you invoke with the [RUNMODAL Function \(Page\)](RUNMODAL-Function--Page-.md) or the [PAGE.RUNMODAL Function](PAGE-RUNMODAL-Function.md), you must use the **ModalFormHandler** function. For more information, see [How to: Create Handler Functions](How-to--Create-Handler-Functions.md).  
  
## Example  
 This example shows how to use the **TRAP** function to trap a call to open a test page so that the opened page is assigned to a variable.  
  
 This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerCard|TestPage|Customer|  
|CustomerStatistics|TestPage|Customer Statistics|  
  
```  
CustomerCard.OPENEDIT;   
CustomerStatistics.TRAP; // The next page that is invoked will be trapped and assigned to the CustomerStatistics variable.  
CustomerCard."Page Customer Statistics".INVOKE; // Invokes an action from the Customer Card page.   
CustomerStatistics."Balance (LCY)".ASSERTEQUALS(0); // Now that the CustomerStatistics test page is open, you can use the variable to test the page.  
```