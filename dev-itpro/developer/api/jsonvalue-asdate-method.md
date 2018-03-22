---
title: "AsDate Method"
ms.author: solsen
ms.custom: na
ms.date: 06/30/2017
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

 

# AsDate Method

Converts the value in a JsonValue to a Date data type.

```
Date := JsonValue.AsDate
```

### Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-class.md)

## Return Value
Type: Date

## Remarks
If the JsonValue does not contain a string of the format "yyyy-MM-dd" e.g. "2017-01-17" (2017-Janury-17), the operation will fail with a run-time error.

## See Also
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
