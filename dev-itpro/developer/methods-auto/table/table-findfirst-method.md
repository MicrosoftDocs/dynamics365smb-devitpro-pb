---
title: "FindFirst Method"
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
# FindFirst Method
Finds the first record in a table based on the current key and filter.

## Syntax
```
[Ok := ]  Table.FindFirst()
```

## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method should be used instead of **FIND**\('-'\) when you only need the first record.  
  
 You should only use this method when you explicitly want to find the first record in a table or set. Do not use this method in combination with **REPEAT**.. **UNTIL**.  
  
## Example  
 This example requires that you create the following variable.  
  
|Variable name|Datatype|Subtype|  
|-------------------|--------------|-------------|  
|SalesSetupRec|Record|Sales & Receivables Setup|  
  
 This example also assumes that you have a **ConfigurePost** method.  
  
```  
// Read the first record only.   
IF SalesSetupRec.FINDFIRST THEN BEGIN  
  ConfigurePost(SalesSetupRec);  
END;  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)