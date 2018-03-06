---
title: "FIELDCOUNT Function (KeyRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 303b302e-4804-4b02-8822-eed66104086e
caps.latest.revision: 14
---
# FIELDCOUNT Function (KeyRef)
Gets the number of fields that have been defined in a key. Returns an error if no key is selected.  
  
## Syntax  
  
```  
  
No := KeyRef.FIELDCOUNT  
```  
  
#### Parameters  
 *KeyRef*  
 Type: KeyRef  
  
 The keyref that refers to the key.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of fields that have been defined in the key.  
  
## Example  
 The following example retrieves the number of fields that are defined in a key in record. The table with ID 18 \(the Customer table\) is open with a reference to table 18. The [KEYINDEX Function \(RecordRef\)](KEYINDEX-Function--RecordRef-.md) function retrieves the second key in the record and store the *KeyRef* in the varKeyRef variable. The [FIELDCOUNT Function \(KEYREF\)](FIELDCOUNT-Function--KeyRef-.md) is then used to return the number of fields defined in the key and displayed in a message box. This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|varKeyRef|KeyRef|  
|VarCount|Integer|  
  
```  
  
RecRef.OPEN(18);  
varKeyRef := RecRef.KEYINDEX(2);  
VarCount := varKeyRef.FIELDCOUNT;  
MESSAGE('The number of fields defined in the key is: %1', VarCount);  
```  
  
## See Also  
 [KeyRef Data Type](KeyRef-Data-Type.md)