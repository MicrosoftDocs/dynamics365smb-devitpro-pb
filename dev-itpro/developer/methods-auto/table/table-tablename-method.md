---
title: "TableName Method"
ms.author: solsen
ms.custom: na
ms.date: 11/06/2018
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
# TableName Method
Gets the name of a table.

## Syntax
```
Name :=   Table.TableName()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

## Return Value
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The [TABLECAPTION Method \(Record\)](../../methods/devenv-tablecaption-method-record.md) retrieves the [Caption Property](../../properties/devenv-caption-property.md) of the table. If you want to enable your application for multilanguage functionality now or in the future, you must use the **TABLECAPTION** method instead of the **TABLENAME** method.  
  
## Example  
 The following example retrieves the name of the **Customer** table by using the CustomerRec variable, a record from the **Customer** table. The value of the **Customer** table name is stored in the TableName variable and displayed in a message box. The value that is displayed is Customer.  
  
 This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|TableName|Text|Not applicable|  
  
```  
TableName := CustomerRec.TABLENAME;  
MESSAGE('The name of the table is: %1', TableName);  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)