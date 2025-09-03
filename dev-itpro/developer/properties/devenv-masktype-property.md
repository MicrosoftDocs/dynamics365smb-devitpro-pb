---
title: "MaskType property"
description: "Specifies whether the field value should be masked for security purposes."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# MaskType Property
> **Version**: _Available or changed with runtime version 16.0._

Specifies whether the field value should be masked for security purposes.

## Applies to
-   Table field
-   Page Field

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**None**|runtime version 16.0|Default value. The field will be displayed without any mask.|
|**Concealed**|runtime version 16.0|The client handles this as a concealed field.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `MaskType` property is defined on a field-level for the following field types: `Code`, `Text`, `Decimal`, `Integer`, and `BigInteger`.

`MaskType` can't be defined together with the [ExtendedDatatype Property](devenv-extendeddatatype-property.md) set to `Masked`, this will throw an error. Also, the `MaskType` property isn't allowed in repeater controls and in ConfigurationDialog pages.

## Related information  

[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  