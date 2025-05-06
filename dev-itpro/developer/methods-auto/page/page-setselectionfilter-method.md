---
title: "Page.SetSelectionFilter(var Record) Method"
description: "Notes the records that the user has selected on the page, marks those records in the table specified, and sets the filter to marked only."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
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

If all records are selected, marks won't be used.  
  
If only the current record is selected on the page, then SetSelectionFilter does the following:  
  
- Sets the current filter group to `0` on the destination record  
- Adds filters on the primary key fields that point to the current record of the page  
  
If more than one record is selected on the page, then SetSelectionFilter does the following:  
  
- Copies the current key from the page source table to the destination record  
- Copies the current sort order from the table to the destination record  
- Copies the current filters that are set in all filter groups  
- Copies the current filter group  
- Marks the selected records and sets the "marked only" filter

> [!IMPORTANT]
> SetSelectionFilter is not directly supported on pages based on temporary source tables and therefore needs to be replaced with a custom page method (see Example 2 below).

## Example 1

The following example shows how to use the **SetSelectionFilter** method to update the record or records from the `Contact` table that the user has selected on the current page.

```al
var
    Contact: Record Contact;
    CRMIntegrationManagement: Codeunit "CRM Integration Management";
    ContactRecordRef: RecordRef;
begin
    CurrPage.SetSelectionFilter(Contact);
    Contact.Next();

    if Contact.Count = 1 then
        CRMIntegrationManagement.UpdateOneNow(Contact.RecordId)
    else begin
        ContactRecordRef.GetTable(Contact);
        CRMIntegrationManagement.UpdateMultipleNow(ContactRecordRef);
    end;
end;
```

## Example 2 (temporary records)

For retrieving selected records on pages with a temporary source table, the following example shows how to define a custom method on a page that is based on a temporary `Contact` table. Other objects need to call the custom method instead of the **SetSelectionFilter** method.

```al
procedure SetTempSelectionFilter(var TempContact: Record Contact temporary)
begin
    TempContact.Copy(Rec, true);
    CurrPage.SetSelectionFilter(TempContact);
end;
```

## Related information

[Page Data Type](page-data-type.md)
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
