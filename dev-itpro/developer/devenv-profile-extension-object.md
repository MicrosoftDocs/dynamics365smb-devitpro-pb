---
title: Profile Extension Object
description: Description of the profile extension object, which allows you to modify an individual experience for each user profile.
author: qutreson
ms.date: 07/06/2024
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
---

# Profile extension object

[!INCLUDE[2024_releasewave2](../includes/2024-releasewave2.md)]

The profile extension object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] allows you to customize existing user profiles. The profile extension object allows you to override properties from the target profile such as the role center page or the profile caption, and allows you to define additional [page customization objects](devenv-page-customization-object.md) to apply to the profile.

> [!NOTE]  
> Page customizations only apply to the RoleCenter they are specified for. In order to see them, in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] under **My Settings**, **Role Center** change to the specific RoleCenter that a page customization is defined for.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!NOTE]  
> The property `allowDebugging`, which is a setting under `resourceExposurePolicy` does not apply to page customizations. Page customizations defined in an extension with `allowDebugging` set to `false` can still be copied Use Designer. For more information, see [Resource Exposure Policy Setting](devenv-security-settings-and-ip-protection.md).

## Snippet support
Typing the shortcut `tprofileextension` will create the basic layout for a profile extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Profile Extension example
The following profile extension object example extends the `Business Manager` profile by **replacing** its description and its role center page. It also **adds** the customization `MyCustomization` to the list of customizations applied for the `Business Manager` profile. The customization modifies the layout of the `Customer List` to make the `Name` field invisible using the `modify` method. For more information, see [Profile Properties](properties/devenv-profile-properties.md).

```AL
profileextension MyProfileExt extends "Business Manager"
{ 
    ProfileDescription = 'A detailed description of who is this profile for, why/how to use it (etc)'; 
    RoleCenter = MyNewRoleCenter;
    Customizations = MyCustomization;
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
