---
title: "Page.SetTableView(var Record) Method"
description: "Applies the table view on the current record as the table view for the page, report, or XmlPort."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Page.SetTableView(var Record) Method
> **Version**: _Available or changed with runtime version 1.0._

Applies the table view on the current record as the table view for the page, report, or XmlPort.


## Syntax
```AL
 Page.SetTableView(var Record: Record)
```
## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  

*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record that has a table view that you want to apply to the page or data item.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The table view is the view of the table that you present to the user. You determine what records that the user can see by setting filters, determining the sorting order, and selecting the keys.  
  
This method only narrows the view of the table that was set through the [SourceTableView Property](../../properties/devenv-sourcetableview-property.md) of the page or through the [DataItemTableView Property](../../properties/devenv-dataitemtableview-property.md) of the data item.  
  
> [!IMPORTANT]  
> SetTableView is not supported for setting views on subpages from code on table headers. For example, you cannot set a table view on the SalesOrder subpage from the SalesHeader.  
  
## Example

This example is based on the Sales Header table and shows how SetTableView is used for a page object.

```al
 var
    SalesHeader: Record "Sales Header";
    SomePage: Page "Sales List";
begin
    SalesHeader.SetCurrentKey("Document Type");  
    SalesHeader.SetRange("Document Type",SalesHeader."Document Type"::Order);  
    SomePage.SetTableView(SalesHeader); // Only view sales orders.  
    SomePage.Run;
end;
```  
  
The page that is reference by the SomePage variable can be any page object that has Sales Header as the value of the [SourceTable Property](../../properties/devenv-sourcetable-property.md).  

## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)