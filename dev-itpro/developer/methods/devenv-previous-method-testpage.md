---
title: "PREVIOUS Method (TestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 9cd6ac83-84c1-4aa5-984b-f95afb1e4dde
caps.latest.revision: 9
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# PREVIOUS Method (TestPage)
Sets the current row of the test page as the previous row in the dataset.  
  
## Syntax  
  
```  
  
OK := TestPage.PREVIOUS  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page variable that you use to refer to the test page.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the current row was set to the previous row in the dataset successfully; otherwise, **false**.  
  
## Remarks  
 If *TestPage* is closed or has never been opened, then the method call fails.  
  
## Example  
 This example requires that you create a TestPage variable named CustomerList with a Subtype of Customer List.  
  
```  
CustomerList.OPENVIEW;  
…  
IF CustomerList.LAST THEN REPEAT  
  MESSAGE(CustomerList.Name);  
UNTIL NOT CustomerList.PREVIOUS;  
  
```