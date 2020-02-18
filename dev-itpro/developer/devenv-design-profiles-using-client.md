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

Using the client to create and modify profiles can be a useful alternative to writing AL code directly in Visual Studio Code, because you are working with the user interface just as the users would. This is especially advantageous for consultants, application administrators, and less technical users. Profiles that are created in the client are referred to as **\(user-created\)** profiles and are indicated as such in **Profiles** page in the client. A consequence of using the client alone is that the profile-related changes pertain only to the tenant in which they were made. In contrast, profiles and page customizations that are extension-based are published to the application server instance and available for installation on all tenants.

However, you can export user-created profiles and page customizations from the client to a profile package, which is a .zip file that includes profiles and page customizations as AL code. The profile package is essentially includes all profile customizations that are not introduced by extensions. Once you have the profile package, you can:

- Import the profile package as-is to another tenant

- Extract the files in the package and make additional modifications. Then, include the modified files in a zip and import to a tenant.

- Extract the files and include them in a Visual Studio Code project. Then, compile them into an extension package that can be published and available to all tenants.

## Exporting profiles

To export user-created profiles and page customizations from the client, open the **Profiles (Roles)** page, and select the **Export User-Created Profiles** action. A profile.zip file is downloaded to your computer. The zip files contains .al files for the profile and page customizations, plus an app.json and profiles.json file

<!--
However, you can export user-created profiles and page customizations from the client to files (.al type) that contain the changes as AL code. Once you have the files, you can include them in a Visual Studio Code project and compile them into an extension package that can be published and available to all tenants. To export user-cret profiles and page customizations from the client, open the **Profiles (Roles)** page, and select the **Export User-Created Profiles** action. A .zip file is downloaded to your computer. The zip files contains .al files for the profile and page customizations, plus an app.json and profiles.json file.
-->

## Profile Package

A profile package contains the following files:

- app.json file
- profile.json file.
- Profile._<profile ID>_.al file for each user-created profile
- ProfileExtension.
- PageCustomization._[page name]_.Configuration\<number\>.al file for each page customization


## Exported profiles

Each user-created profile is exported to a separate .al file that contains the `profile` object that defines the profile ID, name, and Role Center, and includes references the page customizations it uses. For example, you created a profile with the ID **MyProfile** that uses the role center page **9022 Business Manager Role Center**, and you customized the Business Manager Role Center itself, plus the **Customer** list page. The exported zip file would contain file called **PROFILE.MyProfile.al** that includes the following code:

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

The `Customizations` property identifies the page customization objects used by the profile.

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

## Import profiles

You can update your list of profiles (roles) by uploading a package file that you exported earlier.

Importing a package can add new profiles or replace existing profiles and their page modifications. Before you import a package, we recommend that you create a copy of your existing profiles by using the Export Profiles action on the Profiles (Roles) page.

When you replace a profile, signed-in users who are assigned to the profile may be interrupted briefly.


After choosing a package, you can select which profiles you want to add or replace before committing the change.


Describe a "Profile Package": file format and structure, AL format, beware tampering, export/import, different from legacy profiles, not an extension but can copy code
Clarify what is exported, what is imported:
All changes initiated by users that are not introduced by extensions.
New profiles created by users, including their page customizations
Changes to the basic properties of a profile
Changes to page customizations for a profile that originated from an extension
Use words "import" "export" "add" (profile) "replace" (profile)
Explain that this cannot be used to import or migrate legacy profiles from earlier versions of Dynamics NAV and Dynamics 365 Business Central.
Note that if the user does not have the special permission set "D365 Profile Mgmt" but have read access to the Profiles list, they can still export profiles as a means to hand off to Support for troubleshooting purposes. Export is by nature a readonly operation.

## See Also
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Object](devenv-page-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Extension Properties](properties/devenv-page-property-overview.md)   
