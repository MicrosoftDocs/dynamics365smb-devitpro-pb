---
title: "LAST Method (TestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8ddbf594-1942-46fc-97a7-1f3c3353b568
caps.latest.revision: 5
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# LAST Method (TestPage)
Sets the current row of the test page as the last row in the dataset.  
  
## Syntax  
  
```  
  
OK := TestPage.LAST  
```  
  
#### Parameters  
 *TestPage*  
 The test page variable that you use to refer to the test page.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if a record exists in the dataset and the current row was successfully set to the last row in the dataset; otherwise, **false**.  
  
## Remarks  
If *TestPage* is closed or has never been opened, then the method call fails.  

The LAST method loops over all records until it sets  the identifies the current record.  For each record, the [OnAfterGetCurrentRecord Trigger](../triggers/devenv-OnAfterGetCurrRecord-Trigger.md) is executed.  
  
## Example  
 This example sets the current row to the last customer in the dataset. It requires that you create a TestPage variable named CustomerList with a Subtype of Customer List.  
  
```  
CustomerList.OPENVIEW;  
CustomerList.LAST;  
MESSAGE(CustomerList.Name.Value);  
  
```