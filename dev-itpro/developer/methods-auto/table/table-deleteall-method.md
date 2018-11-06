---
title: "DeleteAll Method"
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
# DeleteAll Method
Deletes all records in a table that fall within a specified range.

## Syntax
```
 Table.DeleteAll([RunTrigger: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to run the AL code in the OnDelete Trigger. If this parameter is true, then the code in the OnDelete trigger will be executed. If this parameter is false, then the code in the OnDelete trigger will not be executed. The default value is false.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example requires that you create a Record variable for the **Customer** table named CustomerRec.  
  
```  
// This AL code:  
WHILE CustomerRec.FIND('-') DO  
  CustomerRec.DELETE;  
// Performs the same operation as:  
CustomerRec.DELETEALL;  
```  
  
 When *RunTrigger* is **false** \(the default\), the **DELETEALL** method in this example is much faster than the **DELETE** method because it requires only one call to the server, while the first method requires multiple calls. If *RunTrigger* is **true**, then there will not be any gain in performance because each record needs to be loaded to the client anyway in order to execute the **OnDelete** trigger.  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)