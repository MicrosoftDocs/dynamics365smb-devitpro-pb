---
title: "DefaultFieldsValidation property"
description: "Sets a value that indicates whether fields are validated."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DefaultFieldsValidation Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a value that indicates whether fields are validated.

## Applies to
-   Xml Port

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**True** if fields are validated; otherwise, **false**. The default value is **true**.

## Syntax

```AL
DefaultFieldsValidation = false;  
```
  
## Remarks

This property sets the default value of the [FieldValidate Property](devenv-fieldvalidate-property.md). Therefore, if you change the setting of the DefaultFieldsValidation property, the change is implemented for all fields. However, for fields for which the **FieldValidate** property has been set to **true** or **false**, no change is made.  
  
If you change the value of the **FieldValidate** property, the change does not affect the value of the **DefaultFieldsValidation** property. This means that **FieldValidate** can override **DefaultFieldsValidation**, but that it can also inherit the default value of **DefaultFieldsValidation**.  
  
## Related information  

[Properties](devenv-properties.md)