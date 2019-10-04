---
title: "IsEmpty Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# IsEmpty Method
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

 When you are using SQL Server, this method is faster than using the [COUNT Method \(Record\)](../../methods/devenv-count-method-record.md) and then testing the result for zero.  

 This method works the same as the [ISEMPTY Method \(Record\)](../../methods/devenv-isempty-method-record.md).  

## Example  
 The following example opens table 18, the customer table as a RecordRef variable that is named. CustomerRecref. The [ISEMPTY Method \(RECORDREF\)](../../methods/devenv-isempty-method.md) determines whether the table is empty. The message box displays **No** because the Customer table is not empty. **No** represents **false**. This example requires that you create the following global variable and text constant.  

|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Is the table empty? %1.|  

```  

CustomerRecref.OPEN(18);  
IsEmpty := CustomerRecref.ISEMPTY;  
MESSAGE(Text000, IsEmpty);  
```  

 If you open table 78 \(Printer Selection\), the message will display **Yes** because the table is empty.  


## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)