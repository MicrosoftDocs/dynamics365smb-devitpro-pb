---
title: "AsInteger Method"
ms.author: solsen
ms.custom: na
ms.date: 07/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# AsInteger Method
Converts the value in a JsonValue to an Integer data type.

## Syntax
```
Result :=   JsonValue.AsInteger()
```

#### Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-data-type.md)  
An instance of the [JsonValue](jsonvalue-data-type.md) data type.  

#### Return Value
*Result*  
&emsp;Type: [Integer](integer-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
If the JsonValue does not contain a number which can be converted without loss of precision to an Integer, the operation will fail with a run-time error.

## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)