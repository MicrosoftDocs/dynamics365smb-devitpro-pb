---
title: "KeyRef.Active Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# KeyRef.Active Method
> **Version**: _Available from runtime version 1.0._

Indicates whether the key is enabled.


## Syntax
```
Ok :=   KeyRef.Active()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*KeyRef*
&emsp;Type: [KeyRef](keyref-data-type.md)
An instance of the [KeyRef](keyref-data-type.md) data type.

## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the key is enabled; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example uses the `KeyRef.ACTIVE` method to determine whether a key in a record is enabled. The table with ID 18 \(the Customer table\) is open with a reference to table 18. The [KEYINDEX Method \(RecordRef\)](../../methods/devenv-keyindex-method-recordref.md) method retrieves the first key in the record and the `varKeyRef.ACTIVE` method returns a Boolean value that indicates whether the retrieved key is enabled. The Boolean value is displayed in a message box. 
 
```  
var
    RecRef: RecordRef;
    varKeyRef: KeyRef;
    IsActive: Boolean;
begin
    RecRef.OPEN(18);  
    varKeyRef := RecRef.KEYINDEX(1);  
    IsActive := varKeyRef.ACTIVE;  
    Message('Is the key active =  %1 ', IsActive);  
end;
```  
  

## See Also
[KeyRef Data Type](keyref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)