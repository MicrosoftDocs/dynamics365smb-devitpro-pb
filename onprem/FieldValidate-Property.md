---
title: "FieldValidate Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8687a629-92cf-4b57-9f8c-b906a0e97728
caps.latest.revision: 6
manager: edupont
---
# FieldValidate Property
Sets a value that specifies whether the values in the source field are validated by the [OnValidate \(Fields\) Trigger](OnValidate--Fields--Trigger.md) trigger for the field.  
  
## Applies To  
 XMLports  
  
## Property Value  
 **Yes** if the fields are validated; otherwise, **No**. The default value is **Undefined**.  
  
## Remarks  
 This property only applies to fields and works in combination with the [DefaultFieldsValidation Property](DefaultFieldsValidation-Property.md) XMLport property.  
  
 The DefaultFieldsValidation property sets the value for the FieldValidate XMLport field property. Therefore, if you change the setting of the DefaultFieldsValidation property, the change is implemented for all fields. However, if the FieldValidate property of a field is set to **Yes** or **No**, no change will be made to this field.  
  
 If you change the value of the FieldValidate property, the change does not affect the value of the DefaultFieldsValidation property. This means that FieldValidate can override DefaultFieldsValidation, but that it can also inherit the default value of DefaultFieldsValidation.  
  
## See Also  
 [DefaultFieldsValidation Property](DefaultFieldsValidation-Property.md)   
 [OnValidate \(Fields\) Trigger](OnValidate--Fields--Trigger.md)