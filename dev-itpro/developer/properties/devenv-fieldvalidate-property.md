---
title: "FieldValidate Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# FieldValidate Property

Sets a value that specifies whether the values in the source field are validated by the [OnValidate (Fields) Trigger](../triggers/devenv-onvalidate-fields-trigger.md) trigger for the field.  
  
## Applies to  

- Field elements in XMLports 
- Field attributes in XMLports
  
## Property Value  

**True** if the fields are validated; otherwise, **false**. The default value is **Undefined**.  

## Syntax

```
FieldValidate = false;
```
 
## Remarks  

This property only applies to fields and works in combination with the [DefaultFieldsValidation Property](devenv-defaultfieldsvalidation-property.md) XMLport property.  
  
The DefaultFieldsValidation property sets the value for the FieldValidate XMLport field property. Therefore, if you change the setting of the DefaultFieldsValidation property, the change is implemented for all fields. However, if the FieldValidate property of a field is set to **true** or **false**, no change will be made to this field.  
  
If you change the value of the FieldValidate property, the change does not affect the value of the DefaultFieldsValidation property. This means that FieldValidate can override DefaultFieldsValidation, but that it can also inherit the default value of DefaultFieldsValidation.  
  
## See Also  

[DefaultFieldsValidation Property](devenv-defaultfieldsvalidation-property.md)   
[OnValidate (Fields) Trigger](../triggers/devenv-onvalidate-fields-trigger.md)