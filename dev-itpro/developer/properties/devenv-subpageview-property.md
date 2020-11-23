---
title: "SubPageView Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SubPageView Property
> **Version**: _Available from runtime version 1.0._

Sets the table view for a subpage.
The following syntax is valid for the SubPageView property:

```
SubPageView =
[<SORTING>[<KeyList>] [ORDER(Ascending|Descending)] [WHERE(<TableFilters>)]
<KeyList> ::= PagePartTableKey1, PagePartTableKey2, ...
<TableFilters> ::= <TableFilter> {,<TableFilter>}
<TableFilter> ::= <PagePartTableFieldName>= CONST(<FieldConst>) | FILTER(<FilterExpression>)
```


## Applies to
-   Page Part
-   Page System Part
-   Page Chart Part

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

The table view is the view of the table that you present to the user. You determine what records the user can see by setting filters, determining the sorting order, and selecting the keys.  
  
You can use this property to sort the information in the table for display in this part.


## Example

```AL
SubPageView = sorting("No.") where (City=filter('Miami'));
```

For an example of a page part using the `SubPageView` property, see [Adding a FactBox to a Page](../devenv-adding-a-factbox-to-page.md).

## See Also 
 
[Properties](devenv-properties.md)  
[SubPageLink Property](devenv-subpagelink-property.md)  
 