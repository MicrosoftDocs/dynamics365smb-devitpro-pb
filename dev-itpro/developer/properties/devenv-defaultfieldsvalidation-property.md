---
title: "DefaultFieldsValidation Property"
ms.custom: na
ms.date: 06/01/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 7733c6fd-3cbd-42bc-9ff3-8f7a5850cff8
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# DefaultFieldsValidation Property
Sets a value that indicates whether fields are validated.  
  
## Applies To  
 XMLports  
  
## Property Value  
 **True** if fields are validated; otherwise, **false**. The default value is **true**.  
  
## Remarks  
 This property sets the default value of the [FieldValidate Property](devenv-fieldvalidate-property.md). Therefore, if you change the setting of the DefaultFieldsValidation property, the change is implemented for all fields. However, for fields for which the FieldValidate property has been set to **true** or **false**, no change is made.  
  
 If you change the value of the FieldValidate property, the change does not affect the value of the DefaultFieldsValidation property. This means that FieldValidate can override DefaultFieldsValidation, but that it can also inherit the default value of DefaultFieldsValidation.  
  
## See Also  
 [Properties](devenv-properties.md)