---
title: "Relation Method"
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
# Relation Method
Determines the table relationship of a given field.

## Syntax
```
TableNumber :=   Table.Relation(Field: Any)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](any-data-type.md)  
The field for which you want to find the table relationship.
          


## Return Value
*TableNumber*  
&emsp;Type: [Integer](integer-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can use this method for several purposes, such as to determine lookups or to check if you have permission to read from a table.  
  
## Example  
 The following example displays the number of the table that has a relation with the City field in the **Customer** table. In this example, table number 225, the **Post Code** table, is displayed because a table relation exists in the City field. If a relation does not exist, then an error message is displayed. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|varTableNumber|Integer|Not applicable|  
  
```  
varTableNumber := CustomerRec.RELATION (CustomerRec.City);  
MESSAGE('%1', varTableNumber);  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)