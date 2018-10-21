---
title: "Next Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
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
# Next Method
Steps through a specified number of records and retrieves a record.

## Syntax
```
[Steps := ]  Table.Next([Steps: Integer])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Steps*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the direction of the search and how many records to step over. This parameter follows the following rules:
-   > 0  Search Steps records forward in the table.
-   < 0  Search Steps records backward in the table.
-   = 0  Stay on the same record in the table.
If you do not specify this parameter, then the next record is found.
          


## Return Value
*Steps*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method locates a record positioned a given number of steps forward or backward from *Record*. Movement through the table is governed by the filters and the current key associated with the records. The fields in *Record* that will be compared with the current key fields must contain appropriate values before the method is called.  
  
## Example  
 This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Count|Integer|Not applicable|  
|CustomerRec|Record|Customer|  
  
```  
Count := 0;  
IF CustomerRec.FIND('-') THEN  
  REPEAT  
    Count := Count + 1;  
  UNTIL CustomerRec.NEXT = 0;  
```  
  
 This code uses a **REPEAT UNTIL** loop to count the number of entries in the **Customer** table. The **FIND** method finds the first entry in the table. Each time the **NEXT** method is called, it steps one record forward. When **NEXT** equals zero \(0\), there are no more entries in the table and the loop is exited.  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)