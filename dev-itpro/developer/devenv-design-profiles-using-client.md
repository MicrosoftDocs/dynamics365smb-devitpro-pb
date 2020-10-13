---
title: "Using the Client to Create Profiles"
description: "Gives an overview of how to create profiles by using the client together with Visual Studio Code."
author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Using the Client to Create Profiles and Page Customizations

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

Besides creating profiles and page customizations by writing AL code, you can use the client. The client is a useful alternative, because you work with the user interface just as the users would. This method is especially advantageous for consultants, application administrators, and less technical users.

## Overview

For detailed instructions on how to use the client to create and modify profiles, see the following articles in the Business Central application help:

- [Create Profiles](/dynamics365/business-central/admin-users-profiles-roles#to-create-a-profile)
- [Customize Pages for Profiles](/dynamics365/business-central/ui-personalization-manage).

A consequence of using the client is that profile changes apply only to the tenant. Extension-based profiles and customizations, by contrast, are available for all tenants. However, the client lets you export user-created profiles and page customizations from a tenant, then import them on another tenant.

Profiles created in the client are marked as **\(user-created\)** profiles. The export and import functionality lets you:

- Backup profile and page customizations locally.
- Make further changes to profiles and page customizations away from the production environment.
- Replicate profiles and page customizations on other environments and tenants.
- Preview changes in sandbox environments before going into production.

> [!IMPORTANT]
> You can't use the import functionality to migrate legacy profiles from Dynamics NAV or early versions of Business Central.

<!--
Describe a "Profile Package": file format and structure, AL format, beware tampering, export/import, different from legacy profiles, not an extension but can copy code
Clarify what is exported, what is imported:
All changes initiated by users that are not introduced by extensions.
New profiles created by users, including their page customizations
Changes to the basic properties of a profile
Changes to page customizations for a profile that originated from an extension
Use words "import" "export" "add" (profile) "replace" (profile)

<!--
To export user-created profiles and page customizations,  are exported to a *profile package*.  User-created* profiles and page customizations essentially include all modifications that are not made directly by extensions. A profile package is a .zip file that includes the user-created profiles and page customizations as AL code.

- Make additional modifications before importing to a tenant.

- Use the files as the starting point for extension-based profiles. 

    Create an AL project in a Visual Studio Code project. Then, compile them into an extension package that can be published and available to all tenants.
-->

## Exporting profiles

When you export profiles, the system exports all user-defined profiles and page customizations that have been made in the tenant. It doesn't export profiles and page customizations introduced by extensions.

To export profiles from the client, open the **Profiles (Roles)** page, and select the **Export Profiles** action. A zip file is downloaded to your computer. The file is referred to as a *profile package*.

Once you have the profile package, you can import it as-is to another tenant. Or, you extract the files and make more changes to profiles and page customizations. When you're done, you compress the files into a profile package again and import it on tenants.

> [!NOTE]
> To export profiles, a user requires read permission to the **Profiles** page and table as a minimum. This capability allows normal users to hand over profiles to others for troubleshooting.

## Importing profiles

Importing profiles lets you add new profiles and page customizations on a tenant or replace existing ones. To import profiles, do the following steps:

1. Get the profile package that contains the new or modified profiles.
2. Before you import a package, we recommend that you export the current profiles so you have a copy.
3. Open the **Profiles (Roles)** page, select the **Import Profiles** action, and follow the instructions to import the profile package.

    You don't have to import all profiles contained in the package. You can select specific profiles. 

When you replace a profile, signed-in users of the profile may be interrupted briefly.

> [!IMPORTANT]
> To import profiles, you must be assigned the **SUPER** or **D365 Profile Mgmt** permission set.
<!--
However, you can export user-created profiles and page customizations from the client to files (.al type) that contain the changes as AL code. Once you have the files, you can include them in a Visual Studio Code project and compile them into an extension package that can be published and available to all tenants. To export user-cret profiles and page customizations from the client, open the **Profiles (Roles)** page, and select the **Export User-Created Profiles** action. A .zip file is downloaded to your computer. The zip files contains .al files for the profile and page customizations, plus an app.json and profiles.json file.
-->

## Working with the profile package and files

A profile package is a zip file that contains profile and page customizations in separate files. These files basically contain AL source code. The following table provides an overview of the file types in a profile package.

|File type|Description|
|----|-----------|
|app.json|A required configuration file that includes dependencies to the base application and system application. In most cases, you shouldn't modify this file after exporting it. The app.json must be included in the profile package that you import.|
|profile.json|A required configuration file that specifies information about the profiles in the package. In most cases, you shouldn't modify this file after exporting it. The profile.json must be included in the profile package that you import.|
|profile file|An AL file for a user-created profile. There's a separate file for each profile. A profile file has the format `Profile._<profile ID>_.al`.|
|profile extension file|An AL file for customizations made to an extension-based profile. These file types have the format `ProfileExtension._<profile ID>_.al`. |
|page customization file|An AL file that specifies all customizations made to a page for a specific profile. A page customization file has the format `PageCustomization._[page name]_.Configuration\<number\>.al`.|

The sections that follow explain a bit more about the file types and creating the profile package.

### Profile files

Each user-created profile is exported to a separate AL file. This file contains the `profile` object that defines the profile's ID, name, and Role Center. It also includes references to the page customizations it uses. For example, let's say you created a profile with the ID **MyProfile** that uses the role center page **9022 Business Manager Role Center**.  You then customized the Business Manager Role Center itself and the **Customer** list page. The exported profile package would contain a file called **PROFILE.MyProfile.al**. This file would include the following code:

```AL
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

### Profile extension files

Customizations made to extension-based profiles are exported to a profile extension file. This file includes a `profileextension` object that specifies two types of information, depending on the changes:

- Properties that specify metadata like, the CaptionML, ProfileDescriptionML, and RoleCenter. 
- References to configuration files that define page customizations. 

For example, let's say you changed the description and customized the **Customer** page for the **Business Manager** profile that is provided by the Base Application extension. The profile package would then contain the file **ProfileExtension._BUSINESS MANAGER.al**. This file will contain code similar to the following code:

```AL
profileextension BUSINESSMANAGER_1 extends "BUSINESS MANAGER"
{
  CaptionML = ENU='Business Manager';
  Enabled = true;
  ProfileDescriptionML = ENU='My changed functionality for managers in charge of keeping the business viable by determining product and company direction.';
  Promoted = false;
  RoleCenter = 9022;
  Customizations = Configuration3;
}
```

`Configuration3` is a reference to a page customization file for the **Customer** page. For more information, see the next section.

<!--And:

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
-->

### Page customization files

Page customizations made to user-created profiles and extension-based profiles are exported to AL files that include a `pagecustomization` object. This object defines each modification to the page. Referring to the examples above, the zip file would include three files:

- **PageCustomization._Business Manager Role Center_.Configuration1.al**
- **PageCustomization._Customer List_.Configuration2.al**
- **PageCustomization._Customer List_.Configuration3.al**

The files would include code similar to the following code:

##### PageCustomization._Business Manager Role Center_.Configuration1.al

```AL
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

##### PageCustomization._Customer List_.Configuration2.al

```AL
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

##### PageCustomization._Customer List_.Configuration3.al

```AL
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
<!--
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
-->

### Creating a profile package for import

After you make modifications to exported profiles and page customizations, you'll have to create the profile package before you can import the changes.

The profile package doesn't have to contain the same files that were originally exported. But it must contain the app.json and profile.json files. Otherwise, you can't import the package. To create the profile package, just compress the files into a zip folder.  

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Object](devenv-page-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Extension Properties](properties/devenv-page-property-overview.md)   
