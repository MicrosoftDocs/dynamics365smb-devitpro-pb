---
title: "Using the Client to Create Profiles"
description: "Gives an overview of how to create profiles by using the client together with Visual Studio Code."
author: jswymer
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Using the Client to Create Profiles and Page Customizations

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

Using the client can be a useful alternative to writing AL code directly in Visual Studio Code because you are working with the user interface just as the users would. This is especially advantageous for consultants, application administrators, and less technical users. But a consequence of using the client alone is that the profile-related changes pertain only to the tenant in which they were made. In contrast, profiles and page customizations that are extension-based are published to the application server instance and available for installation on all tenants.

However, you can export user-defined profiles and page customizations from the client to files (.al type) that contain the changes as AL code. Once you have the files, you can include them in a Visual Studio Code project and compile them into an extension package that can be published and available to all tenants. To export user-defined profiles and page customizations from the client, open the **Profiles (Roles)** page, and select the **Export User-Created Profiles** action. A .zip file is downloaded to your computer. The zip files contains .al files for the profile and page customizations, plus an app.json and profiles.json file.

> [!NOTE]
> Currently, you can only export profiles. Importing profiles will be supported in a future release.

## Exported profiles

Profiles that are created in the client are indicated as **\(user-created\)**. Each user-created profile is exported to a separate .al file that contains the `profile` object that defines the profile ID, name, and Role Center, and includes references the page customizations it uses. For example, you created a profile with the ID **MyProfile** that uses the role center page **9022 Business Manager Role Center**, and you customized the Business Manager Role Center itself, plus the **Customer** list page. The exported zip file would contain file called **PROFILE.MyProfile.al** that includes the following code:

```
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

The 'Customizations` property identifies the page customization objects used by the profile.

## Exported page customizations for user-created profiles

Page customizations that are made to user-created profiles are exported to .al files that include a `pagecustomization` object that defines the modification to the page. A separate file is created for each customized page. Referring to the example above, the zip file would include two files: **PageCustomization._Business Manager Role Center_.Configuration1.al** and **PageCustomization._Customer List_.Configuration2.al**. The files would include code similar to the following:

```
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

```
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

## Exported page customizations for extension-based profiles

Page customizations that are made to extension-based profiles are exported to two types of .al files. The first file includes a `profileextension` object that specifies which profile has been modified and includes references to the page customization object files. The second file type includes a `pagecustomization` object that defines the modification to the page. A separate file is created for each customized page. For example, if you customized the **Customer** page for the **Business Manager** profile that is provided by the Base Application extension, the zip file would contain two files: **ProfileExtension._BUSINESS MANAGER.al** and **PageCustomization._Customer List_.Configuration2.al**. The files will contain code similar to the following:

```
profileextension BUSINESSMANAGER_1 extends "BUSINESS MANAGER"
{
  Customizations = Configuration3;
}
```

And:

```
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
> Currently, the `profileextension` object, app.json, and profiles.json are only used internally for managing profiles from the client. You cannot develop and compile these in AL with Visual Studio Code. This will be be supported in a future release.  

## See Also
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Object](devenv-page-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Extension Properties](properties/devenv-page-property-overview.md)   
