---
title: "RECORD Method (KeyRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: b0b42069-8957-4169-9046-49b1172eb040
caps.latest.revision: 8
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RECORD Method (KeyRef)
Returns a RecordRef for the current record referred to by the key.  
  
## Syntax  
  
```  
  
RecordRef := KeyRef.RECORD  
```  
  
#### Parameters  
 *KeyRef*  
 Type: KeyRef  
  
 The keyref that refers to the key that is currently selected.  
  
## Property Value/Return Value  
 Type: RecordRef  
  
 The RecordRef of the record that is currently selected referenced by the key. If a key is not selected, an error is returned.  
  
## Example  
 The table with ID 18 \(the Customer table\) is open with a reference. The [KeyRef Data Type](../datatypes/devenv-KeyRef-Data-Type.md) for the record is retrieved by using the [KEYINDEX Method \(RecordRef\)](devenv-KEYINDEX-Method-RecordRef.md). The method retrieves the key that has an index of 1 in the record and stores the value in the varKeyRef variable. The varKeyRef variable is then used to return the [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md). This example requires that you create the following global variables.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|varKeyRef|KeyRef|  
  
```  
  
RecRef.OPEN(18);  
varKeyRef := RecRef.KEYINDEX(1);  
RecRef := varKeyRef.RECORD;  
```  
  
## See Also  
 [KeyRef Data Type](../datatypes/devenv-KeyRef-Data-Type.md)   
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)