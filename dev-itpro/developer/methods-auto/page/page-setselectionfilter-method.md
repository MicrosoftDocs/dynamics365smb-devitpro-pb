---
title: "Page.SetSelectionFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# Page.SetSelectionFilter Method
> **Version**: _Available or changed with runtime version 1.0._

Notes the records that the user has selected on the page, marks those records in the table specified, and sets the filter to "marked only".


## Syntax
```
 Page.SetSelectionFilter(var Record: Record)
```
## Parameters
*Page*
&emsp;Type: [Page](page-data-type.md)
An instance of the [Page](page-data-type.md) data type.

*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If all records are selected, marks will not be used.  
  
If only the current record is selected on the page, then SetSelectionFilter does the following:  
  
- Sets the current filter group to `0` on the destination record  
- Adds filters on the primary key fields that point to the current record of the page  
  
If more than one record is selected on the page, then SetSelectionFilter does the following:  
  
- Copies the current key from the page source table to the destination record  
- Copies the current sort order from the table to the destination record  
- Copies the current filters that are set in all filter groups  
- Copies the current filter group  
- Marks the selected records and sets the "marked only" filter 

## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)