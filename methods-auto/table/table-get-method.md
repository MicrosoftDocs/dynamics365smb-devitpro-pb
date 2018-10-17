---
title: "Get Method"
ms.author: solsen
ms.custom: na
ms.date: 09/28/2018
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
# Get Method
Gets a record based on values stored in primary key fields.

## Syntax
```
[Ok := ]  Table.Get([Value: Any,...])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Value*  
&emsp;Type: [Any](any-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method always uses the primary key for the table. It ignores any filters that are set, except security filters. Security filters are applied or ignored based on the Security Filter Mode. The current key and filters are not changed after you call this method. <!--Links For more information, see [Security Filter Modes](Security-Filter-Modes.md)-->.  

 This method ignores any call to the [SETAUTOCALCFIELDS Method \(Record\)](devenv-SETAUTOCALCFIELDS-Method-Record.md). Therefore, a **GET** call on a record after a **SETAUTOCALCFIELDS** call does not automatically calculate FlowFields in the record.  

 > [!NOTE]  
> You cannot use the GET method to retrieve a record in a table by its primary key value if the primary key field in the table has the data type RecordID. In this case, you can retrieve the record by using the Record.SETRANGE(FieldName, FieldValue) method.

## Example  
 This example requires that you create the following global variable and text constants.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  

|Text constant|ConstValue|  
|-------------------|----------------|  
|Text000|The record was found.|  
|Text001|The record could not be found.|  

```  
CustomerRec.GET('1120');  
// This statement causes a run-time error if customer 1120 cannot be   
// found. To avoid this, use the following construct:  
IF CustomerRec.GET('1120') THEN  
  MESSAGE(Text000)  
ELSE  
  MESSAGE(Text001);  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)