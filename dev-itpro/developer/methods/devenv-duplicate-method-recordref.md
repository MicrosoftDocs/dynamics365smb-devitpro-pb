---
title: "DUPLICATE Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 9c57c8c0-5b99-4f9b-aecc-e6895e2da1e2
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DUPLICATE Method (RecordRef)
Duplicates the table that contains the RecordRef.  
  
## Syntax  
  
```  
  
RecordRef := RecordRef.DUPLICATE  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that identifies the record and the table that you want to duplicate.  
  
## Property Value/Return Value  
 Type: RecordRef  
  
## Remarks  
 The RecordRef that is returned refers to a new record with the same filters, current keys, and marks as the original RecordRef. Any changes that you make to the filters, current keys, and marks of the new record are not observed in the original. This differs from assigning one RecordRef to another RecordRef. If you assign one RecordRef to another RecordRef, then both refer to the same record and changes that you make to one RecordRef are observed in the other RecordRef.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable named RecordRef1 and uses the DUPLICATE method to copy the filters, current keys and marks from RecordRef1 into a new RecordRef variable named RecordRef2. After the DUPLICATE method is executed, the RecordRef1 and RecordRef2 variables are identical. This example requires that you create the following global variables and text constants.  
  
|Name|DataType|  
|----------|--------------|  
|RecordRef1|RecordRef|  
|RecordRef2|RecordRef|  
  
|Text constant name|ENU value|  
|------------------------|---------------|  
|Text000|'RecordRef1 refers to the %1 table.\\ RecordRef2 refers to the %2 table.'|  
  
```  
RecordRef1.OPEN(18);  
RecordRef2 := RecordRef1.DUPLICATE;  
MESSAGE(Text000, RecordRef1.CAPTION, RecordRef2.CAPTION);  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)