---
title: "SetRecFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
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
# SetRecFilter Method
Sets the values in the current key of the current record as a record filter.

## Syntax
```
 Table.SetRecFilter()
```

## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 You can use this method to set a filter on a table before you run a report. Enter AL code similar to the following example in the [OnAction Trigger](../../triggers/devenv-onaction-trigger.md) of an action on a page. When the code is triggered, the current key fields of the current record in the page will be used as a filter when the report is run.  
  
 This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
```  
CustomerRec.SETRECFILTER;  
REPORT.RUN(REPORT::"111",FALSE,FALSE,CustomerRec);   
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)