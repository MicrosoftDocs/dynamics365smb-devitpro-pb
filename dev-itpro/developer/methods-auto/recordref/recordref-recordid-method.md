---
title: "RecordId Method"
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
# RecordId Method
Gets the RecordID of the record that is currently selected in the table. If no table is selected, an error is generated.


## Syntax
```
RecordID :=   RecordRef.RecordId()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*RecordID*  
&emsp;Type: [RecordId](../recordid/recordid-data-type.md)  
The ID of the table.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named MyRecordRef. The [FINDLAST Method \(RecordRef\)](../../methods/devenv-findlast-method.md) finds the last record in the table. The record id of the last record is retrieved, stored in the RecID variable displayed in message box. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|RecID|RecordID|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The record id for the last record is: %1|  
  
```  
  
MyRecordRef.OPEN(18);  
MyRecordRef.FINDLAST;  
RecID := MyRecordRef.RECORDID;  
MESSAGE(Text000, RecID);  
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)