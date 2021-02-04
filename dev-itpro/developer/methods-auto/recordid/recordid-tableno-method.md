---
title: "RecordId.TableNo Method"
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
# RecordId.TableNo Method
> **Version**: _Available from runtime version 1.0._

Gets the table number of the table that is identified by RecordID. This function returns an error if the record is blank.


## Syntax
```
No :=   RecordId.TableNo()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*RecordId*
&emsp;Type: [RecordId](recordid-data-type.md)
An instance of the [RecordId](recordid-data-type.md) data type.

## Return Value
*No*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The ID of the table.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

In previous versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)], if a RecordID referred to a temporary table, then the table number value of the RecordID was the run-time generated sequence ID, which is from the base value of 2000100000. You could use the table number to determine if a RecordID referred to a temporary table. In [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)], the table number value of a RecordID always contains the ID of the originating physical table and not the run-time generated sequence ID. If you previously used the [TableNo Method \(RecordID\)](../recordid/recordid-tableno-method.md) to test for the sequence number and determine if the RecordID was temporary, then you use the [IsTemporary Method \(RecordRef\)](../recordref/recordref-istemporary-method.md) in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] instead.  
  
## Example

The following example opens the Customer table with the record reference variable named RecRef and finds the first record in the Customers table. If a record is found, the [RecordId Method \(RecordRef\)](../recordref/recordref-recordid-method.md) gets the ID of the first record in the table. The TableNo method then uses the RecID variable to retrieve the number of the table that contains the record. The table number is then displayed in a message box. 

```al
var
    RecRef: RecordRef;
    RecID: RecordID;
    varTableNumber: Integer;
begin  
    RecRef.Open(Database::Customer);  
    if RecRef.Find('-') then begin  
      RecID := RecRef.RecordId;  
      varTableNumber := RecID.TableNo;  
      Message('The Customer table is number: %1', varTableNumber);  
    end else begin
    Message('No records found in the table');  
    end;  
end;
```  
  

## See Also
[RecordId Data Type](recordid-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)