---
title: "CURRENTKEY Function (TestPage Filter)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c11ec835-402d-40b9-a280-66c06ea9bfc7
caps.latest.revision: 8
manager: edupont
---
# CURRENTKEY Function (TestPage Filter)
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
 [TestPage Filter Functions](TestPage-Filter-Functions.md)