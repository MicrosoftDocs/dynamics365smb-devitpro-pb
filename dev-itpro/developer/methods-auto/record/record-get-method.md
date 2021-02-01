---
title: "Record.Get Method"
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
# Record.Get Method
> **Version**: _Available from runtime version 1.0._

Gets a record based on values stored in primary key fields.


## Syntax
```
[Ok := ]  Record.Get([Value: Any,...])
```
## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method always uses the primary key for the table. It ignores any filters that are set, except security filters. Security filters are applied or ignored based on the Security Filter Mode. The current key and filters are not changed after you call this method. <!-- For more information, see Security Filter Modes.-->

> [!NOTE]  
> `Get` does not require specifying all fields of the key in the call; any omitted field is treated as default value (for example, ‘’ for text/code, false for boolean). You can only omit from the end of the key, not a field in the middle of a key. If a record with a blank/default value exists that is the one being returned, otherwise it will fail with a record does not exist error.

This method ignores any call to the [SetAutoCalcFields Method](../record/record-setautocalcfields-method.md). Therefore, a Get call on a record after a `SetAutoCalcFields` call does not automatically calculate FlowFields in the record.

> [!NOTE]  
> You cannot use the Get method to retrieve a record in a table by its primary key value if the primary key field in the table has the data type RecordID. In this case, you can retrieve the record by using the [SetRange Method](record-setrange-method.md).

<!--
## Example
This example requires that you create the following variable and text constants in the AL.


Variable name	DataType	Subtype

CustomerRec	Record	Customer


Text constant	ConstValue
Text000	The record was found.
Text001	The record could not be found.

Copy
CustomerRec.Get('1120');  
// This statement causes a run-time error if customer 1120 cannot be   
// found. To avoid this, use the following construct:  
IF CustomerRec.Get('1120') THEN  
  Message(Text000)  
ELSE  
  Message(Text001);  

-->
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)