---
title: "Page.SetSelectionFilter(var Record) Method"
description: "Notes the records that the user has selected on the page, marks those records in the table specified, and sets the filter to marked only."
ms.author: solsen
ms.custom: na
ms.date: 07/13/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Page.SetSelectionFilter(var Record) Method
> **Version**: _Available or changed with runtime version 1.0._

Notes the records that the user has selected on the page, marks those records in the table specified, and sets the filter to "marked only".


## Syntax
```AL
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

## Example

The following example shows how to use the **SetSelectionFilter** method to update the record or records from the `Contact` table that the user has selected on the current page.

```
var
    Contact: Record Contact;
    CRMIntegrationManagement: Codeunit "CRM Integration Management";
    ContactRecordRef: RecordRef;
begin
    CurrPage.SetSelectionFilter(Contact);
    Contact.Next;

    if Contact.Count = 1 then
        CRMIntegrationManagement.UpdateOneNow(Contact.RecordId)
    else begin
        ContactRecordRef.GetTable(Contact);
        CRMIntegrationManagement.UpdateMultipleNow(ContactRecordRef);
end;
```

## See Also
[Page Data Type](page-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)