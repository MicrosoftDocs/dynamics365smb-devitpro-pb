---
title: "FieldRef.GetEnumValueOrdinal Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# FieldRef.GetEnumValueOrdinal Method
Gets the Enum value (or Option member) ordinal value from the Enum metadata for the field that is currently selected.


## Syntax
```
The Enum value ordinal value :=   FieldRef.GetEnumValueOrdinal(Index: Integer)
```
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The index in the list of Enum ordinal values to get the Enum value (or Option member) ordinal value for. The index is 1-based.  


## Return Value
*The Enum value ordinal value*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ordinal value.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)