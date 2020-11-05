---
title: "Promoted (Profile) Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Promoted (Profile) Property

For profiles the **Promoted** property specifies whether or not the profile is available in the **Role Explorer** to the user. **Promoted** can also be set on Page Actions, see [Promoted (Actions) Property](devenv-promoted-action-property.md).
  
## Applies to  
  
- Profiles
  
## Property Value  

**True** if the profile is available from the **Role Explorer** in the UI; otherwise, **false**. The default is **false**.  

## Example

The following code illustrates how to set the **Promoted** property.
 
```AL
profile MyProfile
{ 
    Description = 'Some internal comment that only the Dev can see'; 
    Caption = 'My User-friendly Name'; 
    ProfileDescription = 'A detailed description of who is this profile for, why/how to use it (etc)' 
    RoleCenter = MyRoleCenter; 
    Enabled = true; 
    Promoted = true; 
    Customizations = MyCustomization;
} 
```

## See Also  

[Properties](devenv-properties.md)  
[Promoted (Actions) Property](devenv-promoted-action-property.md) 