---
title: "ASCENDING Method (TestPage Filter)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8c86c2a5-9e4c-46e5-871b-da2e806725bd
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ASCENDING Method (TestPage Filter)
Gets or sets the order in which to search through a dataset on a test page.  
  
## Syntax  
  
```  
[IsAscending :=] TestPage.Part.Filter.ASCENDING([SetAscending]);  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page that displays the dataset to search.  
  
 *Part*  
 Type: Part  
  
 The control that contains the dataset you want to search.  
  
 *Filter*  
 Type: Filter  
  
 The filter that is applied to the dataset.  
  
 *SetAscending*  
 Type: Boolean  
  
 The order in which the dataset will be searched. This parameter is optional.  
  
 *IsAscending*  
 Type: Boolean  
  
 The sort order of the dataset.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the search is performed in ascending order; otherwise, **false**.  
  
## See Also  
 [TestPage Filter Methods](devenv-TestPage-Filter-Methods.md)