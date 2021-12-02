---
title: "Enabled (Profile) Property"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Enabled (Profile) Property

Specifies whether the profile can be used by users or not.

For information about the **Enabled** property for pages, keys and table fields, see [Enabled Property](devenv-enabled-property.md).

## Applies to  

- Profiles

## Property Value

**True** on profiles that should be available to the end-user; otherwise, **false**. **True** is default.

## Syntax

```AL
Enabled = false;
```

## Example

The following code illustrates how to set the **Enabled** property. **True** is default, but just used here for illustration purposes.
 
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

[Table Properties](devenv-table-properties.md)  
[Properties](devenv-properties.md)  
[InDataSet Property](devenv-indataset-property.md)
