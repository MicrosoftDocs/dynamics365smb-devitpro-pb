---
title: "DELETELINK Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c763f80b-adee-47f0-91b0-b50a2221d128
caps.latest.revision: 12
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DELETELINK Method (Record)
Deletes a specified link from a record in a table.  
  
## Syntax  
  
```  
  
Record.DELETELINK(ID)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that contains the link to delete.  
  
 *ID*  
 Type: Integer  
  
 The ID of the link to delete.  
  
## Remarks  
 When you add a link to a page or a table, an entry is created in the **Record Link** system table. Each entry is given an ID.  
  
## Example  
 The following example removes the link that has link ID 20 from the MyRecord record \(record number 30000\) in the **Vendor** table. This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Vendor|  
  
```  
MyRecord.GET('30000')  
MyRecord.DELETELINK(20)  
```  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)