---
title: "NEXT Method (TestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 25e24fec-2c36-4f59-af74-518d4221b3f7
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# NEXT Method (TestPage)
Sets the current row of the test page as the next row in the dataset.  
  
## Syntax  
  
```  
  
OK := TestPage.NEXT  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page variable that you use to refer to the test page.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the current row was set to the next row in the dataset successfully; otherwise, **false**.  
  
## Remarks  
 If *TestPage* is closed or has never been opened, then the method call fails.  
  
## Example  
 This example requires that you create a TestPage variable named CustomerList with a Subtype of Customer List.  
  
```  
CustomerList.OPENVIEW;  
// Loops through all customers and displays the customer name.  
IF CustomerList.FIRST THEN  
  REPEAT  
    MESSAGE(CustomerList.Name);  
UNTIL NOT CustomerList.NEXT;  
  
```