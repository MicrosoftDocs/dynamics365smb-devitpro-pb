---
title: "CURRENTKEY Method (TestPage Filter)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c11ec835-402d-40b9-a280-66c06ea9bfc7
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CURRENTKEY Method (TestPage Filter)
Gets the current key of a dataset that is displayed on a test page.  
  
## Syntax  
  
```  
  
CurrentKey := TestPage.Part.Filter.CURRENTKEY  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page that displays the dataset.  
  
 *Part*  
 Type: Part  
  
 The control on the test page that contains the dataset.  
  
 *Filter*  
 Type: Filter  
  
 The filter that is applied to the dataset.  
  
## Property Value/Return Value  
 Type: Text  
  
 Returns a string that contains the current key.  
  
## See Also  
 [TestPage Filter Methods](devenv-TestPage-Filter-Methods.md)