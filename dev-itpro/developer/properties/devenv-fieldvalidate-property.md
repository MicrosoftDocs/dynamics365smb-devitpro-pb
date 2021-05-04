---
title: "FieldValidate Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# FieldValidate Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a value that specifies whether the values in the source field are validated by the OnValidate (Fields) trigger for the field.

## Applies to
-   Xml Port Field Attribute
-   Xml Port Field Element

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Yes**|If the fields are validated.|
|**No**|If the fields are not validated|
|**Undefined**|The default value.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
FieldValidate = false;
```
 
## Remarks  

This property only applies to fields and works in combination with the [DefaultFieldsValidation Property](devenv-defaultfieldsvalidation-property.md) XMLport property.  
  
The DefaultFieldsValidation property sets the value for the FieldValidate XMLport field property. Therefore, if you change the setting of the DefaultFieldsValidation property, the change is implemented for all fields. However, if the FieldValidate property of a field is set to **true** or **false**, no change will be made to this field.  
  
If you change the value of the FieldValidate property, the change does not affect the value of the DefaultFieldsValidation property. This means that FieldValidate can override DefaultFieldsValidation, but that it can also inherit the default value of DefaultFieldsValidation.  
  
## See Also  

[DefaultFieldsValidation Property](devenv-defaultfieldsvalidation-property.md)   
[OnValidate (Fields) Trigger](../triggers-auto/field/devenv-onvalidate-field-trigger.md)