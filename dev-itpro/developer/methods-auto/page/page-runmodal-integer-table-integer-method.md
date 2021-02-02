---
title: "Page.RunModal Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Page.RunModal Method
> **Version**: _Available from runtime version 1.0._

Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.


## Syntax
```
[Action := ]  Page.RunModal(Number: Integer, Record: Record, FieldNo: Integer)
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the page that you want to run.
        
*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
By default, this method shows the record that was last displayed on the page. For each object, information is stored about the most recently shown record and the attached key and filters. Use this optional parameter to select a specific record to display on the page. The record must be of the same type as the table that is attached to the page. When the record is displayed, the key and filters that are attached to the record are used.
        
*FieldNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Use this optional parameter to select a specific field on which focus will be put.  


## Return Value
*Action*
&emsp;Type: [Action](../action/action-option.md)
Specifies what action the user took on the page.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)