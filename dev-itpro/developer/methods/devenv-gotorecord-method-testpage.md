---
title: "GOTORECORD Method (TestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8015dfd8-1584-455e-82fb-de6f2560a094
caps.latest.revision: 3
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GOTORECORD Method (TestPage)
Finds the specified record in a dataset on a test page.  
  
## Syntax  
  
```  
[Ok :=]TestPage.GOTORECORD(Rec);  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page that contains the dataset.  
  
 *Rec*  
 Type: Record  
  
 The record to find.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the specified record is found; otherwise, **false**. The return value is optional.  

## Remarks
The GOTORECORD method loops over all records until it finds the identifies record.  For each record, the [OnAfterGetCurrentRecord Trigger](../triggers/devenv-OnAfterGetCurrRecord-Trigger.md) is executed.  

## See Also  
 [TestPage Methods](devenv-TestPage-Methods.md)