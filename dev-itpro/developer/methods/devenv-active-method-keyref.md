---
title: "ACTIVE Method (KeyRef)"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 244d2346-f51a-444c-8de0-80a201c8ce18
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ACTIVE Method (KeyRef)
Indicates whether the key is enabled.  
  
## Syntax  
  
```  
  
Ok := KeyRef.ACTIVE  
```  
  
#### Parameters  
 *KeyRef*  
 Type: KeyRef  
  
 The keyref that refers to a key.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if the key is enabled; otherwise, **false**.  
  
## Example  
 The following example uses the `KeyRef.ACTIVE` method to determine whether a key in a record is enabled. The table with ID 18 \(the Customer table\) is open with a reference to table 18. The [KEYINDEX Method \(RecordRef\)](devenv-keyindex-method-recordref.md) method retrieves the first key in the record and the `varKeyRef.ACTIVE` method returns a Boolean value that indicates whether the retrieved key is enabled. The Boolean value is displayed in a message box. This example requires that you create the following global variables.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|varKeyRef|KeyRef|  
|IsActive|Boolean|  
  
```  
  
RecRef.OPEN(18);  
varKeyRef := RecRef.KEYINDEX(1);  
IsActive := varKeyRef.ACTIVE;  
MESSAGE('Is the key active =  %1 ', IsActive);  
```  
  
## See Also  
 [KeyRef Data Type](../datatypes/devenv-keyref-data-type.md)