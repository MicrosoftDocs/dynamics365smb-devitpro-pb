---
title: "AddTable Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
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
# AddTable Method
Adds filter control for a table to a filter page.

## Syntax
```
[Name := ]  FilterPageBuilder.AddTable(Name: String, TableNo: Integer)
```
## Parameters
*FilterPageBuilder*  
&emsp;Type: [FilterPageBuilder](filterpagebuilder-data-type.md)  
An instance of the [FilterPageBuilder](filterpagebuilder-data-type.md) data type.  

*Name*  
&emsp;Type: [String](string-data-type.md)  
Assigns a name to the filter control for the table. The text displays as the caption for the filter control on the rendered filter page in the client.
        
*TableNo*  
&emsp;Type: [Integer](integer-data-type.md)  
The ID of the table object that you want to filter on.  


## Return Value
*Name*  
&emsp;Type: [String](string-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
The text that is specified by the Name parameter. If an error occurs at runtime, an empty text string is returned.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 In the filter page that is rendered in the client, the ADDTABLE method defines a filter control for the specified table where the user can set filters on specific fields in the table.  

 You can use the ADDFIELD or ADDFIELDNO method to add field of the table to the filter control.  

## Example  
 The following example initializes a filter page object that includes a filter control that uses the Date system table. The filter control has the caption of **Date record**.  

 This example requires that you create the following global variables.  

|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varFilterPageBuilder|FilterPageBuilder||  

```  
varDateItem := 'Date record';  
FilterPageBuilder.ADDTABLE(varDateItem, DATABASE::Date);  

```  

## See Also
[FilterPageBuilder Data Type](filterpagebuilder-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)