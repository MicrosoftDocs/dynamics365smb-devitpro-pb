---
title: "SubPageView Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: f87172d4-6c05-48b5-b3f6-039e47534e2b
caps.latest.revision: 7
---

 

# SubPageView Property
Sets the table view for a subpage.  

## Syntax
```
SubPageView = [<SORTING>[<KeyList>] [ORDER(Ascending|Descending)] [WHERE(<TableFilters>)]<KeyList> ::= PagePartTableKey1, PagePartTableKey2, <TableFilters> ::= <TableFilter> {,<TableFilter>}<TableFilter> ::= <PagePartTableFieldName>= CONST(<FieldConst>) | FILTER(<FilterExpression>)
```
## Applies To  
  
-   Pages  
  
## Remarks  
 The table view is the view of the table that you present to the user. You determine what records the user can see by setting filters, determining the sorting order, and selecting the keys.  
  
 You can use this property to sort the information in the table for display in this subpage.

## Example

```
SubPageView = sorting("No.") where (City=filter('Miami'));
```
 ## See Also  
 [Properties](devenv-properties.md)  
 [SubPageLink Property](devenv-subpagelink-property.md)
 