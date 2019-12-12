---
title: "RequestFilterFields Property"
ms.custom: na
ms.date: 12/10/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
 
# RequestFilterFields Property

Specifies which fields are automatically included on the tab of the request page that is related to a report's data item or an XMLport's table element. The user can set filters on these fields.  

## Applies to  
  
- Data items on reports  
  
- Table elements on XMLports
  
## Property Value
A comma-separated list of field names.  

## Example

```
RequestFilterFields="No.","Search Name","Customer Posting Group";
```
  
## Remarks  
A user can add other fields to the request page and set filters on these fields. We recommend that you use this property for common filter fields. If the source table of a report or XMLport has many fields, then it is time-consuming for a user to add fields to the request page.  
  
If you do not want users to add filters on fields, then use one of the following methods:  
  
- Do not specify any filters in the **RequestFilterFields** property and specify a key field on which to sort in the [DataItemTableView Property](devenv-dataitemtableview-property.md) for a report and in the [SourceTableView (XMLports) Property](devenv-sourcetableview-XMLports-property.md) for an XMLport.  
  
- Remove the request page by using the [UseRequestPage Property](devenv-userequestpage-property.md) of the report or XMLport.  

## See Also
[Request Pages](../devenv-request-pages.md)  