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

### Arguments
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

> [!NOTE]  
> In previous versions `OnPrem` was equivalent to `Internal` and `Cloud` was equivalent to `External`. Both `Internal` and `External` options are being deprecated.

For more information, see [Compilation Scope Overview](../devenv-compilation-scope-overview.md).

## Example

Setting the attribute on a method. Each method must be explicitly marked with `[Scope('OnPrem')]` because default is `[Scope('Cloud')]`.

```AL
procedure MyProcedureForCloud()
    begin
        Message('My procedure is available in cloud, but cannot call any onprem method.');
    end;

[Scope('OnPrem')]
procedure MyProcedureForOnPrem()
    begin
        Message('My procedure is not available to a cloud extension.');
    end;

```
  
## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[JSON Files](../devenv-json-files.md)  
[Access Property](../properties/devenv-access-property.md)  
[Extensible Property](../properties/devenv-extensible-property.md)