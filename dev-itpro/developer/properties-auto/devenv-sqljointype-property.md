---
title: "SqlJoinType Property"
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
# SqlJoinType Property
> **Version**: _Available from runtime version 1.0._

Sets the data item link type between data items in a query to determine the records that are included in the resulting data set.

## Applies to
-   Query Data Item

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|LeftOuterJoin|The resulting dataset contains every record from the upper data item table, even if a record does not have a matching value in the lower data item for fields that are linked by the [DataItemLink Property \(Query\)](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-dataitemlink-query-property).|
|InnerJoin|The resulting dataset contains records from data item tables where a match is found between the fields that are linked by the **DataItemLink** property of the lower data item.|
|RightOuterJoin|The resulting dataset set contains every record from the lower data item table, even if a record does not have a matching value in the upper data item for fields that are linked by the **DataItemLink** property.|
|FullOuterJoin|The resulting dataset contains all the records from the upper data item table, and all records from the lower data item, including records that do not have a matching value for columns that are linked by the **DataItemLink** property.|
|CrossJoin|The resulting dataset contains rows that combine each row from the upper data item table with each row from a lower data item table. Cross joins are also called Cartesian products.<br /><br /> **Important:** Cross Join does not require any comparisons between fields of data items, so the **DataItemLink** property must be left blank.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
 SqlJoinType = InnerJoin;
```
  
## Remarks

When setting up a data item link between two data items, you always set up the **SQLJoinType** property on the lower data item.  
  
Except for `CrossJoin`, the **SQLJoinType** property works together with the **DataItemLink** property to combine records from tables into a dataset. The **DataItemLink** property sets up an "equal to" \(=\) comparison between two or more fields of the data item tables. When the query is run, the query compares each row of the two data items to find records that having matching values for the fields. Records that have matching field values are combined into a row in the resulting dataset. In some cases, there will be records that do not have matching values.
  
For more information, see [Linking and Joining Data Items to Define the Query Dataset](../devenv-query-links-joins.md).

## See Also

[Query Object](../devenv-query-object.md)  
[Properties](devenv-properties.md)  