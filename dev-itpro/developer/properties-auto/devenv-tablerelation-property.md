---
title: "TableRelation Property"
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
# TableRelation Property
Sets up a lookup into another table.
The following syntax is valid for the TableRelation property:

```
TableRelation = <TableName>[.<FieldName>] [WHERE(<TableFilters>)] |
[IF(<Conditions>) <TableName>[.<FieldName>] [WHERE(<TableFilters>)] ELSE <TableRelation>]
<Conditions> ::= <TableFilters>
<TableFilters>::= <TableFilter> {,<TableFilter>}
<TableFilter>::= <DestinationFieldName>=CONST(<FieldConst>) | FIELD(<SourceFieldName>)
```


## Applies to
-   Field
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  