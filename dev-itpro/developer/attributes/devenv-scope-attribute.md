---
title: "Scope attribute"
description: "Specifies the scope of a method."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Scope attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies the scope of a method.


## Applies to

- Method


## Syntax

```AL
[Scope(Kind: Text)]
```

### Arguments
*Kind*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
The scope of the method.  
#### Value

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
> Earlier scope values are deprecated. Use `OnPrem` instead of `Solution` or `Internal`. Use `Cloud` instead of `Personalization` or `Extension`.

Learn more in [Compilation Scope Overview](../devenv-compilation-scope-overview.md).

## Example

Methods use the `Cloud` scope by default. Add `[Scope('OnPrem')]` only to methods that require APIs available exclusively to on-premises extensions.

```AL
procedure MyProcedureForCloud()
begin
    Message('My procedure is available in the cloud but cannot call an on-premises method.');
end;

[Scope('OnPrem')]
procedure MyProcedureForOnPrem()
begin
    Message('My procedure is not available to a cloud extension.');
end;

```
  
## Related information

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[JSON Files](../devenv-json-files.md)  
[Access Property](../properties/devenv-access-property.md)  
[Extensible Property](../properties/devenv-extensible-property.md)
