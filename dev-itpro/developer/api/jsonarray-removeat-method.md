---
title: "RemoveAt Method"
ms.author: solsen
ms.custom: na
ms.date: 12/15/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 9
manager: edupont
author: SusanneWindfeldPedersen
---

 

# RemoveAt Method
Removes the token at the given index.

```
[Ok := ] JsonArray.RemoveAt(Index)
```

## Parameters
*JsonArray*  
&emsp;Type: [JsonArray](jsonarray-class.md)

*Index*  
&emsp;Type: [Integer](../datatypes/devenv-integer-data-type.md)  
&emsp;The position of the element that will be removed.

## Return Value
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

**True** if the operation was successful; otherwise, **false**.

If you omit this optional return value and if the select does not execute successfully, then a run-time error occurs.

## Remarks
1. The operation will fail if the *Index* is smaller than 0 or (greater or equal) than JsonArray.Count.
2. Objects of type JsonArray represent a 0-based array.

## See Also
[JsonArray](jsonarray-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
