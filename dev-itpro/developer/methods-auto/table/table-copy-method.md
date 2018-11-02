---
title: "Copy Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
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
# Copy Method
Copies a specified record, filters, marks, and keys that are associated with the record from a table or creates a reference to a record.

## Syntax
```
 Table.Copy(var FromRecord: Table, [ShareTable: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*FromRecord*  
&emsp;Type: [Table](table-data-type.md)  
The record to copy.
          
*ShareTable*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the function copies filters, marks, and keys of the record or creates a reference to a temporary record. If FromRecord and Record are both temporary and ShareTable is true, then the COPY function causes Record to reference the same table as FromRecord. > If ShareTable is true, then both Record and FromRecord must be temporary; otherwise an error will occur. The default value is false. If you specify false, only filters, marks, and keys are copied.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example copies a record to another record in the **Customer** table. The [GET Method \(Record\)](../../methods/devenv-get-method-record.md) retrieves record number 30000 from the **Customer** table and stores record in the sourceRecord variable. The **COPY** method copies the record that is stored in the sourceRecord to the destRecord. The *ShareTable* parameter is set to **true** because the [Temporary Property](../../properties/devenv-temporary-property.md) for the both sourceRecord and destRecord are set to **true** to make the records temporary. If the record is copied, then a message indicating that the record is copied is displayed in a message box. Otherwise, a message indicating that the record is not copied is displayed. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|sourceRecord|Record|Customer|  
|destRecord|Record|Customer|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|The record is copied.|  
|Text001|The record is not copied.|  
  
```  
IF sourceRecord.GET(30000) THEN BEGIN  
  destRecord.COPY(sourceRecord, TRUE);  
  MESSAGE(Text000);  
END  
ELSE BEGIN  
  MESSAGE(Text001);  
END;  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)