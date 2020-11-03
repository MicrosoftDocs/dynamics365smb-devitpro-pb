---
title: "SourceTableView Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
# SourceTableView Property
Sets the key, sort order, and filter of the source table presented to the user.
The following syntax is valid for the SourceTableView property:

```
TableView =
[<SORTING>[<KeyList>] [ORDER(Ascending|Descending)] [WHERE(<TableFilters>)]
<FieldList> ::= SourceTableKey1, SourceTableKey2, ...
<TableFilters> ::= <TableFilter> {,<TableFilter>}
<TableFilter> ::= <DestinationFieldName>=CONST(<FieldConst>) | FILTER(<FilterExpression>)
```


## Applies to
-   Page
-   Request Page
-   Xml Port Table Element

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  