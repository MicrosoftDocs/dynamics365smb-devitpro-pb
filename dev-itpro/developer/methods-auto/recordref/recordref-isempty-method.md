---
title: "RecordRef.IsEmpty Method"
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
# RecordRef.IsEmpty Method
Determines whether any records exist in a filtered set of records in a table.


## Syntax
```
Empty :=   RecordRef.IsEmpty()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*Empty*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the record or table is empty; otherwise, **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If you have not applied filters to the record, this method determines whether the table is empty. If you have applied filters, the method determines whether the filtered set of records is empty.  

 The number of filters that you have applied to the records affects the speed of the ISEMPTY method. The fewer the number of filters, the faster the operation is performed.  

 When you are using SQL Server, this method is faster than using the [COUNT Method \(Record\)](../record/record-count-method.md) and then testing the result for zero.  

 This method works the same as the [ISEMPTY Method \(Record\)](../record/record-isempty-method.md).  

## Example  
 The following example opens table 18, the customer table as a RecordRef variable that is named. CustomerRecref. The [ISEMPTY Method \(RECORDREF\)](recordref-isempty-method.md) determines whether the table is empty. The message box displays **false** because the Customer table is not empty. **false** represents **false**. 

```  
var
    CustomerRecref: RecordRef;
    Text000: Label 'Is the table empty? %1.';
begin 
    CustomerRecref.OPEN(18);  
    IsEmpty := CustomerRecref.ISEMPTY;  
    MESSAGE(Text000, IsEmpty);  
end;
```  

 If you open table 78 \(Printer Selection\), the message will display **true** because the table is empty.  


## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)