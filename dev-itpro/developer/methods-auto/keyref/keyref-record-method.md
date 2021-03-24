---
title: "KeyRef.Record Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# KeyRef.Record Method
> **Version**: _Available from runtime version 1.0._

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
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)
The RecordRef of the record that is currently selected referenced by the key. If a key is not selected, an error is returned.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

  
 The table with ID 18 \(the Customer table\) is open with a reference. The [KeyRef Data Type](../library.md) for the record is retrieved by using the [KeyIndex Method \(RecordRef\)](../library.md). The method retrieves the key that has an index of 1 in the record and stores the value in the varKeyRef variable. The varKeyRef variable is then used to return the [RecordRef Data Type](../library.md).

```  
var
    RecRef: RecordRef;
    varKeyRef: KeyRef;
begin    
    RecRef.Open(18);  
    varKeyRef := RecRef.KeyIndex(1);  
    RecRef := varKeyRef.Record;  
end;
```  
  

## See Also
[KeyRef Data Type](keyref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)