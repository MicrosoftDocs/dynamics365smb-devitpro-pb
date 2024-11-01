---
title: Profile extension object
description: Description of the profile extension object, which allows you to modify an individual experience for each user profile.
author: qutreson
ms.date: 09/30/2024
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
ms.collection: get-started
---

# Profile extension object

[!INCLUDE[2024_releasewave2](../includes/2024-releasewave2.md)]

The profile extension object in [!INCLUDE [prod_short](includes/prod_short.md)] allows you to customize existing user profiles. The profile extension object allows you to override properties from the target profile such as the role center page or the profile caption, and allows you to define additional [page customization objects](devenv-page-customization-object.md) to apply to the profile.

> [!NOTE]  
> Page customizations only apply to the Role Center they're specified for. In order to see them, in [!INCLUDE [prod_short](includes/prod_short.md)] under **My Settings**, **Role Center** change to the specific Role Center that a page customization is defined for.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!NOTE]  
> The property `allowDebugging`, which is a setting under `resourceExposurePolicy` doesn't apply to page customizations. Page customizations defined in an extension with `allowDebugging` set to `false` can still be copied through **Use Designer**. For more information, see [Resource exposure policy setting](devenv-security-settings-and-ip-protection.md).

## Snippet support

Typing the shortcut `tprofileextension` creates the basic layout for a profile extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Profile extension example

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

## Related information

[AL development environment](devenv-reference-overview.md)  
[Developing extensions](devenv-dev-overview.md)  
[Pages overview](devenv-pages-overview.md)  
[Profile object](devenv-profile-object.md)
[Page customization object](devenv-page-customization-object.md)
