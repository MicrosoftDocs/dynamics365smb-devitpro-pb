---
title: Role-Based Customization in Business Central
description: Understand Business Central customization layers so that you can choose role centers, page extensions, profiles, or personalization for users.
author: SusanneWindfeldPedersen
ms.date: 11/05/2026
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Customize the user interface for user roles

The role-tailored experience in [!INCLUDE[prod_short](includes/prod_short.md)] helps users focus on their work. Developers, administrators, and users can customize pages at different layers, as shown in the following figure. Some changes are made in AL extensions. Others are made from the client.

:::image type="content" source="media/role-customization.png" alt-text="Diagram of role center, page extension, profile customization, and user personalization layers.":::

<a name="role-centers"></a>

## Role centers as a starting point

The role center is the first layer of customization. It's the user's entry point and home page for [!INCLUDE[prod_short](includes/prod_short.md)]. It displays information relevant to the user's role and provides links for viewing data and performing tasks. You can develop different role centers for the profiles of the intended users.

Create a role center in AL by using the `RoleCenter` page type. Learn more in [Designing role centers](devenv-designing-role-centers.md).

## Page extensions and Designer

A [page extension object](devenv-page-ext-object.md) extends a page by adding, moving, or hiding UI elements. Create page extensions in Visual Studio Code or from the client with [Designer](devenv-inclient-designer.md). Page extensions change the shared page definition in environments where the extension is installed. They're not limited to one profile.

## Profiles and page customizations

A *profile* associates a role center and page customizations with a user role. In the client, profiles are referred to as **Roles**. Users can switch their role from **My Settings**. Different profiles can use the same role center. Create profiles in AL extensions or from the client with the appropriate permissions.

On top of the profile are *page customizations*. These modify the layout of specific pages. For example, you can move or hide actions, fields, list columns, or entire parts. These layout changes are also available through personalization. Profile customizations apply to users assigned to that profile. Create them in AL extensions or from the client. Client-created customizations take precedence over AL profile customizations. <!--Page customizations are substractive between layers. This means, for example, if an element such as an action or part is removed at by an extension, it cannot be added by customizing the profile in the client or by personalization.-->

Learn more about profiles and page customization in AL in [Designing profiles](devenv-design-profiles.md). Learn more about using the client in [Customizing the workspace for profiles (roles)](/dynamics365/business-central/ui-personalization-manage).

<!--

- In AL code, profiles are created by using the [profile object](devenv-profile-object.md).
- In the client, profiles are managed from the **Profiles** page. For more information, see [Understanding Users, Roles, and Profiles](/dynamics365/business-central/admin-users-profiles-roles) in the [!INCLUDE[prod_short](includes/prod_short.md)] Application Help.

## Page customizations


- In AL code, you create extension-based page customizations by using the [page customization object](devenv-page-customization-object.md).
- In the client, you create page customizations for profiles from the **Profiles** page. For more information, see [Customizing the Workspace for Profiles (Roles)](/dynamics365/business-central/ui-personalization-manage) in the [!INCLUDE[prod_short](includes/prod_short.md)] Application Help.

-->
<a name="personalization"></a>

## Personalization for individual users

The last layer is personalization. Users personalize their own workspace in the client. These changes take precedence over profile customizations and apply only to that user. Learn more in [Personalizing your workspace](/dynamics365/business-central/ui-personalization-user).

<!--
## Using the client to create AL profiles and page customizations

Creating profiles and page customizations from the client can be a useful alternative to writing AL code directly in Visual Studio Code because you are working with the user interface just as the users would. This is especially advantageous for consultants, application administrators, and less technical users. But a consequence of using the client alone is that the profile-related changes pertain only to the tenant in which they were made. In contrast, profiles and page customizations that are extension-based are published to the application server instance and available for installation on all tenants.

However, you can export user-defined profiles and page customizations from the client to files (.al type) that contain the changes as AL code. Once you have the files, you can include them in a Visual Studio Code project and compile them into an extension package that can be published and available to all tenants. To export user-defined profiles and page customizations from the client, open the **Profiles (Roles)** page, and select the **Export User-Created Profiles** action. A .zip file is downloaded to your computer. The zip file contains .al files for the profile and page customizations, plus an app.json and profiles.json file.  

### Exported profiles

Profiles that are created in the client are indicated as **\(user-created\)**. Each user-created profile is exported to a separate .al file that contains the `profile` object that defines the profile and the page customizations it uses. For example, you created a profile with the ID **MyProfile** that uses the role center page **9022 Business Manager Role Center**, and you customized the Business Manager Role Center itself, plus the **Customer** list page. The exported zip file would contain file called **PROFILE.MyProfile.al** that includes the following code:

```al
profile MyProfile
{
  CaptionML = ENU='My Profile';
  Enabled = true;
  ProfileDescriptionML = ENU='This is my sample profiles';
  Promoted = true;
  RoleCenter = 9022;
  Customizations = Configuration1; Configuration2;
}
```

### Exported page customizations for user-created profiles

Page customizations that are made to user-created profiles are exported to an .al files that include a `pagecustomization` object that defines the modification to the page. A separate file is created for each customized page. Referring to the example above, the zip file would include two files: **PageCustomization._Business Manager Role Center_.Configuration1.al** and **PageCustomization._Customer List_.Configuration2.al**. The files include code similar to the following:

```al
pagecustomization Configuration1 customizes "Business Manager Role Center"
{
  layout
  {
    modify(Control16)
    {
    Visible = false;
    }
  }
  actions
  {
  }
}
```

And:

```al
pagecustomization Configuration2 customizes "Customer List"
{
  layout
  {
    modify("Balance (LCY)")
    {
    Visible = false;
    }
  }
  actions
  {
  }
}
```

### Exported page customizations for extension-based profiles

Page customizations that are made to extension-based profiles are exported to two types of .al files. The first file includes a `profileextension` object that specifies which profile has been modified and includes references to the page customization object files. The second file type includes a `pagecustomization` object that defines the modification to the page. A separate file is created for customized page. For example, if you customized the **Customer** page for the **Business Manager** profile that is provided by the Base Application extension, the zip file would contain two files: **ProfileExtension._BUSINESS MANAGER.al** and **PageCustomization._Customer List_.Configuration2.al**. The files will contain code similar to the following:

```al
profileextension BUSINESSMANAGER_1 extends "BUSINESS MANAGER"
{
  Customizations = Configuration3;
}
```

And:

```al
pagecustomization Configuration3 customizes "Customer List"
{
  layout
  {
    modify("Balance Due (LCY)")
    {
    Visible = false;
    }
  }
  actions
  {
  }
}
```

> [!IMPORTANT]
> Currently, the `profileextension` object and `profiles.json` are only used internally for managing profiles from the client. You can't develop and compile these files in AL by using Visual Studio Code. This capability will be supported in a future release.  
-->

## Related information

[Developing extensions](devenv-dev-overview.md)  
[AL development environment](devenv-reference-overview.md)  
[Page object](devenv-page-object.md)  
[Page extension object](devenv-page-ext-object.md)  
[Page extension properties](properties/devenv-page-property-overview.md)  
