---
title: "KEYINDEX Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: a2fa5c64-5989-40f2-9499-0974ec4ee311
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# KEYINDEX Method (RecordRef)
Gets the KeyRef of the key that has the index specified in the table that is currently selected. The key can be composed of fields of any supported data type. Data types that are not supported include BLOBs, FlowFilters, variables, and methods. If the sorting key is set to a field that is not part of a key, then the KEYINDEX is -1.  
  
## Syntax  
  
```  
  
Key := RecordRef.KEYINDEX(Index)  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that identifies the record and the table in which you are interested.  
  
 *Index*  
 Type: Integer  
  
 The number of the index in which you are interested.  
  
## Property Value/Return Value  
 Type: KeyRef  
  
 The KeyRef of the field that has the specified index.  
  
## Remarks  
 The first key in the index must have index 1, the second index 2, and so on. The last key must have index = KEYCOUNT. If the specified index is out of the range or if no table is selected, the method returns an error.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The loop starts from 1 and loops through the key indexes that are in the table. `CustomerRecref.KEYCOUNT` returns the maximum number of keys that are defined in the table. The loop continues until the last key is reached. For each index that is specified, the KEYINDEX method retrieves the KeyRef for the specified index. The key index and the KeyRef for the specified indexes are displayed in a message box. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|varKeyRef|KeyRef|  
|i|Integer|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|KeyIndex: %1   KeyRef: %2|  
  
```  
  
CustomerRecref.OPEN(18);  
  FOR i := 1 TO CustomerRecref.KEYCOUNT DO BEGIN  
    varKeyRef := CustomerRecref.KEYINDEX(i);  
    MESSAGE(Text000, i, varKeyRef);  
  END;  
CustomerRecref.CLOSE;  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)