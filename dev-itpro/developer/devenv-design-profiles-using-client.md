---
title: Using the Client to Create Profiles
description: Learn how to create, export, modify, and import Business Central profiles and page customizations by using the client and Visual Studio Code.
author: jswymer
ms.date: 11/03/2026
ms.topic: how-to
ms.author: jswymer
ms.reviewer: jswymer
---

# Using the client to create profiles and page customizations

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

You can create profiles, profile extensions, and page customizations in the client instead of writing AL code. Use the Business Central web client to customize pages and export or import profile packages. Working directly with the user interface is useful for consultants, application administrators, and users who don't develop AL extensions.

## Create and reuse profiles

For instructions on creating profiles and customizing their pages, see:

- [Create profiles](/dynamics365/business-central/admin-users-profiles-roles#to-create-a-profile)
- [Customize pages for profiles](/dynamics365/business-central/ui-personalization-manage)

Profiles and page customizations that you create in the client apply in the current environment. You can export them and import them into another environment, including an environment in another tenant. Profiles delivered in an extension are available where that extension is installed.

Profiles that you create in the client are marked as **(User-created)** in the **Source** field. Export and import let you:

- Back up profiles, profile extensions, and page customizations locally.
- Make further changes to profiles, profile extensions, and page customizations away from the production environment.
- Replicate profiles, profile extensions, and page customizations on other environments and tenants.
- Preview changes in sandbox environments before going into production.
- Move your profiles, profile extensions, and page customizations into AL extensions.

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

When you export profiles, the system exports user-created profiles and customizations in the current environment. This process includes changes that users made to profiles from extensions. It doesn't export the profile definitions and page customizations that extensions deliver.

Open the **Profiles (Roles)** page and select **Export Profiles**. The client downloads a ZIP file called a *profile package*.

Import the package as-is into another environment, or extract the files to make further changes. After editing, compress the files into a profile package again for import. You can also use the AL files in an extension.

> [!NOTE]
> To export profiles, you need permission to open the **Profiles (Roles)** page and read the `All Profile` table, along with permissions to run the export. Read access lets you help with troubleshooting without granting permission to import profiles.

## Importing profiles

Import profiles to add or replace profiles and page customizations in an environment.

1. Get the profile package that contains the new or modified profiles.
2. Before you import a package, we recommend that you export the current profiles so you have a copy.
3. Open the **Profiles (Roles)** page, select the **Import Profiles** action, and follow the instructions to import the profile package.

You don't have to import every profile in the package. You can select specific profiles.

When you replace a profile, signed-in users who use that profile might be interrupted.

> [!IMPORTANT]
> To import profiles, you need permissions to manage profiles and page customizations, such as those included in the **SUPER** or **D365 PROFILE MGT** permission set.
<!--
However, you can export user-created profiles and page customizations from the client to files (.al type) that contain the changes as AL code. Once you have the files, you can include them in a Visual Studio Code project and compile them into an extension package that can be published and available to all tenants. To export user-cret profiles and page customizations from the client, open the **Profiles (Roles)** page, and select the **Export User-Created Profiles** action. A .zip file is downloaded to your computer. The zip files contains .al files for the profile and page customizations, plus an app.json and profiles.json file.
-->

## Working with the profile package and files

A profile package is a ZIP file with AL source files for profiles, profile extensions, and page customizations. The AL files are grouped in a folder per profile. The exported `app.json` and `profiles.json` files are at the root of the ZIP file.

|File type|Description|
|----|-----------|
|`app.json`|A required manifest that records extension dependencies used by the exported objects. Keep it in the package and ensure the required extensions are installed in the destination environment. Keep the exported file unless a dependency change is needed.|
|`profiles.json`|A required configuration file with information about the profiles in the package. Keep it in the package that you import. Keep the exported file unless a change is needed.|
|Profile file|An AL file for a user-created profile. Each profile has a separate file with the format `<ProfileId>.Profile.al`.|
|Profile extension file|An AL file for customizations to an extension-based profile, with the format `<ProfileId>.ProfileExt.al`.|
|Page customization file|An AL file with the page customizations for a profile, with the format `<PageName>.PageCust.al`.|

The sections that follow explain a bit more about the file types and creating the profile package.

> [!NOTE]
> This section describes the package structure and file naming for [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 2, version 25.0, and later.

### Profile files

You export each user-created profile to an AL file in a dedicated folder. The `profile` object defines the profile's ID, name, role center, and page customization references. For example, a profile with ID `MyProfile` uses page 9022, **Business Manager Role Center**. You customize that role center and the **Customer List** page. The exported package contains the folder `MYPROFILE` and the file `MYPROFILE.Profile.al`:

```al
profile MyProfile
{
  CaptionML = ENU='My Profile';
  Enabled = true;
  ProfileDescriptionML = ENU='This is my sample profile';
  Promoted = true;
  RoleCenter = 9022;
  Customizations = Configuration1, Configuration2;
}
```

The `Customizations` property identifies the page customization objects used by the profile.

### Profile extension files

Customizations made to extension-based profiles are exported to a profile extension file. This file includes a `profileextension` object that specifies two types of information, depending on the changes:

- Properties such as `CaptionML`, `ProfileDescriptionML`, and `RoleCenter`.
- References to objects that define page customizations.

For example, you change the description and customize the **Customer List** page for the **Business Manager** profile from the Base Application extension. The package includes the `BUSINESS MANAGER` folder and the `BUSINESS MANAGER.ProfileExt.al` file with code similar to:

```al
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

`Configuration3` references the page customization for **Customer List**, which the next section shows.

<!--And:

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
-->

### Page customization files

Export page customizations for user-created and extension-based profiles as AL `pagecustomization` objects. For the preceding examples, the ZIP file includes three files in two folders:

- `MYPROFILE\Business Manager Role Center.PageCust.al`
- `MYPROFILE\Customer List.PageCust.al`
- `BUSINESS MANAGER\Customer List.PageCust.al`

The files would include code similar to the following code:

#### Role center customization for MYPROFILE

File: `MYPROFILE\Business Manager Role Center.PageCust.al`.

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
}
```

#### Customer List customization for MYPROFILE

File: `MYPROFILE\Customer List.PageCust.al`.

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
}
```

#### Customer List customization for BUSINESS MANAGER

File: `BUSINESS MANAGER\Customer List.PageCust.al`.

```al
pagecustomization Configuration3 customizes "Customer List"
{
  layout
  {
    modify("Balance Due (LCY)")
    {
      Visible = true;
    }
  }
}
```
<!--
## Exported page customizations for extension-based profiles

Page customizations that are made to extension-based profiles are exported to two types of .al files. The first file includes a `profileextension` object that specifies which profile has been modified and includes references to the page customization object files. The second file type includes a `pagecustomization` object that defines the modification to the page. A separate file is created for each customized page. For example, if you customized the **Customer** page for the **Business Manager** profile that is provided by the Base Application extension, the zip file would contain two files: **ProfileExtension._BUSINESS MANAGER.al** and **PageCustomization._Customer List_.Configuration2.al**. The files will contain code similar to the following:

```AL
profileextension BUSINESSMANAGER_1 extends "BUSINESS MANAGER"
{
  Customizations = Configuration3;
}
```

And:

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
-->

### Creating a profile package for import

After you edit the exported AL files, create a profile package to import the changes.

Include `app.json`, `profiles.json`, and the AL files required by the profiles that you want to import. You don't have to include every profile from the original export. Compress the files into a ZIP file.

## Related information

[Developing extensions](devenv-dev-overview.md)  
[AL development environment](devenv-reference-overview.md)  
[Page object](devenv-page-object.md)  
[Page extension object](devenv-page-ext-object.md)  
[Page extension properties](properties/devenv-page-property-overview.md)  
