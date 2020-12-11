---
title: "RecordRef.IsTemporary Method"
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
# RecordRef.IsTemporary Method
> **Version**: _Available from runtime version 1.0._

Determines whether a RecordRef refers to a temporary table.


## Syntax
```
Temporary :=   RecordRef.IsTemporary()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

## Return Value
*Temporary*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the RecordRef refers to a temporary table, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 In versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] earlier than [!INCLUDE[nav7long](../../includes/nav7long_md.md)], if a RecordID or a RecordRef referred to a temporary table, then the table number value of the RecordID or RecordRef was the run-time generated sequence ID, which is from the base value of 2000100000. You could use the table number to determine if a RecordID or a RecordRef referred to a temporary table. In [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], the table number value of a RecordID or a RecordRef always contains the ID of the originating physical table and not the run-time generated sequence ID. If you previously used the [TABLENO Method \(RecordID\)](../recordid/recordid-tableno-method.md) or the [NUMBER Method \(RecordRef\)](recordref-number-method.md) to test for the sequence number and determine if the RecordID or RecordRef was temporary, then you must use the ISTEMPORARY method in [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] instead.  
  
## Example  
 This example shows that you can replace code that you used previously to determine if a RecordRef referred to a temporary table. This example requires that you create a RecordRef variable named RecordRefVar.  
  
```  
// Previous code  
ifRecordRefVar.Number >= 2000100000 then begin  
  // Code for temporary tables  
end;  
  
// New code  
ifRecordRefVar.IsTemporary then begin  
  // Code for temporary tables  
end;  
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)