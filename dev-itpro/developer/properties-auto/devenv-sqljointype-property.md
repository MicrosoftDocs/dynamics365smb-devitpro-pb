---
title: "SqlJoinType Property"
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
# SqlJoinType Property
Sets the data item link type between data items in a query to determine the records that are included in the resulting data set.

## Applies to
-   Query Data Item

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|LeftOuterJoin|TODO:Add documentation|
|InnerJoin|TODO:Add documentation|
|RightOuterJoin|TODO:Add documentation|
|FullOuterJoin|TODO:Add documentation|
|CrossJoin|TODO:Add documentation|
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