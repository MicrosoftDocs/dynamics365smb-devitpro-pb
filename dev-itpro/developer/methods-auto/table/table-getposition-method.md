---
title: "GetPosition Method"
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
# GetPosition Method
Gets a string that contains the primary key of the current record.

## Syntax
```
String :=   Table.GetPosition([UseNames: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*UseNames*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example uses the **GETPOSITION** method to retrieve the primary key of the current record \(MyRecord\) from the **Customer** table. The primary key is stored in the varPrimaryKey variable and displayed in a message box. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|varPrimaryKey|Text|Not applicable|  
  
```  
varPrimaryKey := MyRecord.GETPOSITION(TRUE);  
MESSAGE(varPrimaryKey);  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)