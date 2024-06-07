---
title: Profile Extension Object
description: Description of the profile extension object, which allows you to modify an individual experience for each user profile.
author: qutreson
ms.date: 04/01/2024
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
---

# Profile extension object

<!-- TODO(qutreson) -->

The profile extension object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] allows you to build an individual experience for each user profile. The Profile object performs a validation to check whether the specified role center page exists, and [page customization objects](devenv-page-customization-object.md) exists, when you define a new profile object. On a page customization you can add changes to the page layout, and actions; but you cannot add variables, procedures, or triggers. 

> [!NOTE]  
> Page customizations only apply to the RoleCenter they are specified for. In order to see them, in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] under **My Settings**, **Role Center** change to the specific RoleCenter that a page customization is defined for.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!NOTE]  
> The property `allowDebugging`, which is a setting under `resourceExposurePolicy` does not apply to page customizations. Page customizations defined in an extension with `allowDebugging` set to `false` can still be copied Use Designer. For more information, see [Resource Exposure Policy Setting](devenv-security-settings-and-ip-protection.md).

## Snippet support
Typing the shortcut `tprofile` will create the basic layout for a profile object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Profile example
The following profile object example creates a profile for the `MyRoleCenter` Role Center, which is available in the **Role Explorer** in the UI and available to end-users. The profile also depends on the customization `MyCustomization` and modifies the layout of the **Customer List** to make the `Name` field invisible using the `modify` method. For more information, see [Profile Properties](properties/devenv-profile-properties.md).

```AL
profileextension MyProfileExt extends "Business Manager"
{ 
    Caption = 'My User-friendly Name'; 
    ProfileDescription = 'A detailed description of who is this profile for, why/how to use it (etc)'; 
    RoleCenter = MyRoleCenter;
    Enabled = true; 
    Promoted = true; 

    Customizations = MyCustomization; // This adds a new customizations on top of the profile defined one.
} 

pagecustomization MyCustomization customizes "Customer List"
{
    layout
    {
        modify(Name)
        {
            Visible = false;
        }
    }
}
```

## See Also  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Pages Overview](devenv-pages-overview.md)  
[Profile Object](devenv-profile-object.md)
[Page Customization Object](devenv-page-customization-object.md)
