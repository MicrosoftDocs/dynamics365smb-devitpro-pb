---
title: "Designing Profiles"
description: "Gives an overview of profiles and page customizations."
author: jswymer
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Designing Profiles

A profile is the mechanism that makes a Role Center page and its associated pages and reports available to users in the client. It enables you to build an individual experience for users based on their role in the company by customizing the pages that they use to perform the daily tasks. In the client, profiles are referred to as **Roles**. When users sign in to [!INCLUDE[prodshort](includes/prodshort.md)], they are doing so under a specific role. Users can switch the role from the **My Settings** page.

Creating profiles in AL involves two different object types: [profile object](devenv-profile-object.md) and [page customization object](devenv-page-customization-object.md).

## Profile objects

A profile object specifies an ID for the profile, a display name that appears in the client, a role center page, and the page customization objects that apply to the profile. Different profiles can use the same Role Center page.

## Page customization object

A page customization object specifies layout and action modifications to a specific page object. For example, you can move actions, fields, columns on list, or entire parts. The modifications apply only to the profile that they are used with. The page customizations will be seen by all users of the profile.

To make the modifications, you use [placement keywords](devenv-page-ext-object.md#using-keywords-to-place-actions-and-controls) in the `layout` and `actions` sections.

The same page customization objects can used in different profile objects. A profile object does not necessarily use any page customization objects, but a page customization has no effect without being associated with a profile object.

## Example

The following example creates a profile object that uses the `Business Manager` role center page. It uses two page customization objects; one that modifies the **Business Manager Role Center** page and another that modifies the **Customer List** page. 

```
profile TheBoss
{
    Description = 'This is the profile for the Boss';
    RoleCenter = "Business Manager";
    Customizations = MyCustomization1, MyCustomization1;
    Caption = 'Boss';
}

pagecustomization Configuration1 customizes "Business Manager Role Center"
{
  actions
  {
    // Hides the Customers action
    modify(Customers)
    {
      Visible = false;
    }
  }
}

pagecustomization MyCustomization customizes "Customer List"
{
    layout
    {
      {
        // Moves the Balance (LCY) column after the Phone No. column
        moveafter("Phone No.";"Balance (LCY)")
      }
    }
}

```

## Using the client to create AL profiles and page customizations

Creating profiles and page customizations can also be done from the client. This will typically be done by administrators or consultants to create new profiles or fine-tune the page customizations that provided by extensions. However, as a developer, you can also leverage the client to make profiles and page customizations in AL extensions. For more information, see [Using the Client to Create Profiles and Page Customizations](devenv-design-profiles-using-client.md).

## Translating profiles

A profile's `Caption` and `ProfileDescription` properties appear in the client user-interface, so you will typically want to translate these into different languages. Like other objects, this is done by creating XLIFF files for the different languages from the source language. The generated XLIFF file contains a `<source>` tag for both the `Caption` and `ProfileDescription` to which you can add a `<target>` tag for the translated text. For more information, see [Working with Translation Files](devenv-work-with-translation-files.md).

For example, the following code is the content of an XLIFF file for translating the example profile mentioned above from its source language, en-US, to the target language da-DK.

```
<xliff version="1.2" xmlns="urn:oasis:names:tc:xliff:document:1.2" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:1.2 xliff-core-1.2-transitional.xsd">
  <file datatype="xml" source-language="en-US" target-language="da-DK" original="profiles">
    <body>
      <group id="body">
        <trans-unit id="Profile 3523819904 - Property 4111922599" size-unit="char" translate="yes" xml:space="preserve">
          <source>The Boss</source>
          <target>Chefen</target>
          <note from="Developer" annotates="general" priority="2"></note>
          <note from="Xliff Generator" annotates="general" priority="3">Profile TheBoss - Property ProfileDescription</note>
        </trans-unit>
        <trans-unit id="Profile 3523819904 - Property 2879900210" size-unit="char" translate="yes" xml:space="preserve">
          <source>Boss</source>
          <target>Chef</target>
          <note from="Developer" annotates="general" priority="2"></note>
          <note from="Xliff Generator" annotates="general" priority="3">Profile TheBoss - Property Caption</note>
      </group>
    </body>
  </file>
</xliff>
```

## See Also
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Object](devenv-page-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Extension Properties](properties/devenv-page-property-overview.md)   
