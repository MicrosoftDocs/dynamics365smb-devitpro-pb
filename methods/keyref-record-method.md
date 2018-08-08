---
title: "Record Method"
ms.author: solsen
ms.custom: na
ms.date: 08/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Record Method
Returns a RecordRef for the current record referred to by the key.

## Syntax
```
Record :=   KeyRef.Record()
```

## Parameters
*KeyRef*  
&emsp;Type: [KeyRef](keyref-data-type.md)  
An instance of the [KeyRef](keyref-data-type.md) data type.  

## Return Value
*Record*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
[KeyRef Data Type](keyref-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)