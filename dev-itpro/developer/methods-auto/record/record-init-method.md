---
title: "Record.Init() Method"
description: "Initializes a record in a table."
ms.author: solsen
ms.custom: na
ms.date: 06/02/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.Init() Method
> **Version**: _Available or changed with runtime version 1.0._

Initializes a record in a table.


## Syntax
```AL
 Record.Init()
```

## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

This method assigns default values to each field in the record, including the SystemId field when a table is created. For any new field added later into the record, values are initialized by default or by using [InitValue Property (Record)](../properties/devenv-initvalue-property.md). If no value was assigned when the table was created, the values are assigned based on the data type, as shown in the following table.

  
|Data type|Default value|  
|---------|-------------------|  
|BigInteger|0|  
|BigText|\<Empty>|  
|BLOB|\<Empty>|  
|Boolean|No|  
|Code|'' \(empty string\)|  
|Date|0d \(Undefined date\)|  
|DateFormula|'' \(empty string\)|  
|DateTime|0DT \(Undefined datetime\)|  
|Decimal|0.0|  
|Duration|0|  
|GUID|00000000-0000-0000-0000-000000000000|  
|Integer|0|  
|Option|0|  
|RecordID|\<Empty>|  
|TableFilter|\<Empty>|  
|Text|'' \(empty string\)|  
|Time|0T \(Undefined time\)|  
  
> [!NOTE]  
> Primary key and timestamp fields are not initialized.  
 
After the method runs, you can change the values in any or all of the fields before you call the [Insert Method (RecordRef)](../recordref/recordref-insert--method.md) to enter the record in the table. Be sure that the fields that make up the primary key contain values that make the total primary key unique. If the primary key isn't unique (such as the record already exists), then the record is rejected.  
  
The method works in the same way as the [Init Method (RecordRef)](../recordref/recordref-init-method.md).  

> [!NOTE]  
> You don't have to use the `Init()` method every time you insert a record, it depends on your use case. For example, if the values need to be refreshed with each iteration in a loop or if they are inserted through a parameter. In both cases, you can use the `Init()` method to make sure that the record aligns with the other data in the table.

## See Also

[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)