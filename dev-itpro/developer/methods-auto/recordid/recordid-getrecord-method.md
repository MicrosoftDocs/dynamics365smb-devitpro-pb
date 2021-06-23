---
title: "RecordId.GetRecord Method"
description: "Gets a RecordRef that refers to the record identified by the RecordID."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# RecordId.GetRecord Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a RecordRef that refers to the record identified by the RecordID.


## Syntax
```AL
RecordRef :=   RecordId.GetRecord()
```

## Parameters
*RecordId*  
&emsp;Type: [RecordId](recordid-data-type.md)  
An instance of the [RecordId](recordid-data-type.md) data type.  

## Return Value
*RecordRef*  
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)  
The RecordRef of the record.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 No data is read from the database when you run this method and therefore, no other fields in the record are set. Furthermore, no filters are set on the record.

## Example

The following example opens table number 18 \(Customer table\) and sets a reference to the table. The [FindLast Method \(RecordRef\)](../recordref/recordref-findlast-method.md) selects the last record in the table. The [RecordId Method \(RecordRef\)](../recordref/recordref-recordid-method.md) retrieves the ID of the currently selected record. In this case, it is the last record in the table. The [GetRecord Method \(RecordId\)](../recordid/recordid-getrecord-method.md) uses the retrieved record ID to determine the RecordRef of the selected record \(the last record\). This example requires that you create the following global variables and text constant.  

```al
var
    RecRef: RecordRef;
    RecID: RecordID;
```

```al
RecRef.Open(18);  
RecRef.FindLast;  
RecID := RecRef.RecordId;   
RecRef := RecID.GetRecord;  
```  


## See Also
[RecordId Data Type](recordid-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)