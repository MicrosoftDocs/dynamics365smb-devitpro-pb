---
title: "DataCaptionFields property"
description: "Sets the fields that appear to the left of the caption on pages that display the contents of this table."
ms.author: solsen
ms.date: 04/09/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataCaptionFields Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the fields that appear to the left of the caption on pages that display the contents of this table.

## Applies to
-   Table
-   Request Page
-   Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
DataCaptionFields = "Customer Name", "Company Display Name";
```

## Remarks  
  
## Card pages

Card pages display a single record at a time. For this page type, the value of the `DataCaptionFields` property is taken from the underlying table. Any value set for this property on the page itself is ignored. If the `DataCaptionFields` property isn't defined on the table, the primary key of the table is used as a fallback.  
  
## Tabular pages  

Tabular pages display multiple records simultaneously. For these pages, a data caption is shown only if a filter applied to the fields defined in the `DataCaptionFields` property evaluates to a single value. Two situations can occur:  
  
- **With a table relation**: If a table relation exists (as defined by the [TableRelation Property](devenv-tablerelation-property.md)) the `DataCaptionFields` from the underlying table is used. If the related table doesn't define this property, the primary key is used.
  
- **Without a table relation**: If no table relation exists, the single value resulting from the filter is used directly.  
  
## Example of usage 

The following example illustrates how the `DataCaptionFields` property is used. 

The Customer Card page (ID 21) is based on the Customer table (ID 18). Using the **Navigate** menu on this page, users can open other pages, including the Customer Ledger Entry page (25).  
  
In the Customer table, the `DataCaptionFields` property is set to **No., Name**. On the Customer Ledger Entry page, the `DataCaptionFields` property is set to **Customer No.**. When the Customer Ledger Entry page (ID 25) is opened from the Customer Card page (ID 21), a filter is set on the **Customer No.** field of the Customer Ledger Entries table, showing only entries related to the currently displayed customer on the Customer Card. This is achieved by setting the **RunPageLink** property of the menu item that invokes the Customer Ledger Entry page to `Customer No.=Field(No.)`.  
  
If you view the Customer Ledger Entry page with a filter applied, the customer name and number appear to the left of the caption on the Customer Ledger Entry page. If you remove the filter, the caption disappears.  

## Key takeaway

The `DataCaptionFields` property doesn't directly add captions to a page. Instead, it works in conjunction with the table-level configuration and other properties, such as `RunPageLink` to provide meaningful captions in specific contexts.
  
## Related information  

[Properties](devenv-properties.md)