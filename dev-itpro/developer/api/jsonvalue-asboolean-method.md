---
title: "AsBoolean Method"
ms.author: solsen
ms.custom: na
ms.date: 06/29/2017
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

 

# AsBoolean Method

Converts the value in a JsonValue to a Boolean data type.

```
Boolean := JsonValue.AsBoolean
```

### Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-class.md)

## Return Value
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

## Remarks
The operation will succeed if the value was created from a Boolean using *SetValue* or if the value was parsed from a string containing one of the values : "true" or "false". The operation will fail with a run-time error otherwise.


## See Also
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)