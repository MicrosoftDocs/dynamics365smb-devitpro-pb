---
title: "SourceTableView Property (XMLports)"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: f49d8c45-f2e6-4c96-a53b-31ddd1883e3b
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

# SourceTableView Property (XMLports)
> **Version**: _Available from runtime version 1.0._

Sets the key, sort order, and filter of the source table presented to the user.
  
## Applies to  

- Table elements in XMLports  

## Syntax

```AL
SourceTableView = SORTING(Code);
```
 
## Remarks  

To sort a set of table fields in the table view, use the **sorting** keyword. To sort the records in ascending or descending order, use the **order** keyword.  And, to apply a set of filters in the table view, use the **where** keyword.

## See Also  

[Properties](devenv-properties.md)