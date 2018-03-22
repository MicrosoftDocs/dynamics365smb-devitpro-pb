---
title: "FIRST Method (TestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 1bba710e-8631-4057-b42b-01ba3683d128
caps.latest.revision: 6
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FIRST Method (TestPage)
Sets the current row of the test page as the first row in the dataset.  
  
## Syntax  
  
```  
  
OK := TestPage.FIRST  
```  
  
#### Parameters  
 *TestPage*  
 The test page variable that you use to refer to the test page.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if a record exists in the dataset and the current row was successfully set to the first row in the dataset; otherwise, **false**.  
  
## Remarks  
 If *TestPage* is closed or has never been opened, then the method call fails.  
  
## Example  
 This example sets the current row to the first customer in the dataset. It requires that you create a TestPage variable named CustomerList with a Subtype of Customer List.  
  
```  
CustomerList.OPENVIEW;  
CustomerList.FIRST;  
MESSAGE(CustomerList.Name.Value);  
  
```  
  
## See Also  
 [TestPage Methods](devenv-TestPage-Methods.md)