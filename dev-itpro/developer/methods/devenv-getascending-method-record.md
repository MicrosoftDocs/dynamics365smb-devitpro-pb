---
title: "GETASCENDING Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8210a809-ecc9-4254-8887-b91d48763de8
caps.latest.revision: 2
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETASCENDING Method (Record)
Gets the sort order for the records returned. You can use GETASCENDING to identify the sort order of the specified field because fields can be sorted in ascending or descending order.  
  
 For example, you can read data from an ODATA web service where the data is sorted in ascending order on the Name field but in descending order on the City field.  
  
## Syntax  
  
```  
  
OK:= Record.GETASCENDING(Field)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record in the table to search.  
  
 *Field*  
 Type: Field  
  
 The field that you want to get the sort order for.  
  
## Return Value  
 Type: Boolean  
  
 **true**, if the specified filed is sorted in ascending order; otherwise **false**.  
  
## See Also  
 [SETASCENDING Method \(Record\)](devenv-SETASCENDING-Method-Record.md)   
 <!--Links [OData Web Services](OData-Web-Services.md)-->