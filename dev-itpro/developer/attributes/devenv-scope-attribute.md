---
title: "Scope Attribute"
description: "Specifies the scope of a method."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Scope Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies the scope of a method.


## Applies To

- Method


## Syntax

```
[Scope(Kind: Text)]
```

### Parameters
*Kind*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
The scope of the method.

#### Parameter value

|Value|Compatibility|
|-----------|---------------------------------------|
|**Solution**|Available or changed with runtime version 1.0 until version 4.0 where it was deprecated for the following reason: "The Solution scope is being deprecated. Use OnPrem instead."|
|**Personalization**|Available or changed with runtime version 1.0 until version 4.0 where it was deprecated for the following reason: "The Personalization scope is being deprecated. Use Cloud instead."|
|**Extension**|Available or changed with runtime version 1.0 until version 4.0 where it was deprecated for the following reason: "The Extension scope is being deprecated. Use Cloud instead."|
|**Internal**|Available or changed with runtime version 1.0 until version 4.0 where it was deprecated for the following reason: "The Internal scope is being deprecated. Use OnPrem instead."|
|**Cloud**|Available or changed with runtime version 4.0.|
|**OnPrem**|Available or changed with runtime version 4.0.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  