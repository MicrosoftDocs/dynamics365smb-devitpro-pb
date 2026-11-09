---
title: Designing Profiles in Business Central
description: Learn how to use AL profiles, profile extensions, and page customizations to tailor Business Central pages to user roles and translate profile text.
author: jswymer
ms.date: 11/05/2026
ms.topic: concept-article
ms.author: jswymer
ms.reviewer: jswymer
---

# Designing profiles

A *profile* makes a role center page and its associated pages and reports available to users in the client. Use profiles to tailor [!INCLUDE[prod_short](includes/prod_short.md)] pages to the daily tasks of a role in the company. In the client, profiles are referred to as roles. Users can switch their **Role** on the **My Settings** page.

Creating profiles in AL involves three different object types: [profile object](devenv-profile-object.md), [profile extension object](devenv-profile-ext-object.md), and [page customization object](devenv-page-customization-object.md).

## Profile objects

A profile object specifies an ID for the profile, a display name that appears in the client, a role center page, and the page customization objects that apply to the profile. Different profiles can use the same role center page.

## Profile extension objects

A profile extension object overrides properties of a profile object defined in another AL extension, such as its caption or role center page. It can also define additional page customization objects to apply to the profile.

## Page customization object

A page customization object specifies layout and action modifications to a specific page object. For example, you can move actions, fields, columns on a list, or entire parts. The modifications apply to all users of the profiles that use the customization.

To make the modifications, you use [placement keywords](devenv-page-ext-object.md#using-keywords-to-place-actions-and-controls) in the `layout` and `actions` sections.

The same page customization objects can be used in different profile objects. A profile object doesn't have to use page customization objects, but a page customization has no effect without being associated with a profile.

## Profile and page customization example

The following example creates a profile object that uses the `"Business Manager Role Center"` page. It uses two page customization objects. One hides the **Customers** action on the role center. The other moves the **Balance (LCY)** column after **Phone No.** on the **Customer List** page.

```al
using Microsoft.Finance.RoleCenters;
using Microsoft.Sales.Customer;

profile TheBoss
{
    ProfileDescription = 'The Boss';
    RoleCenter = "Business Manager Role Center";
    Customizations = BusinessManagerCust, CustomerListCust;
    Caption = 'Boss';
}

pagecustomization BusinessManagerCust customizes "Business Manager Role Center"
{
    actions
    {
        modify(Customers)
        {
            Visible = false;
        }
    }
}

pagecustomization CustomerListCust customizes "Customer List"
{
    layout
    {
        moveafter("Phone No."; "Balance (LCY)")
    }
}
```

## Using the client to create AL profiles, profile extensions, and page customizations

Administrators and consultants can create profiles or fine-tune page customizations in the client. As a developer, you can export these changes for use in AL extensions. Learn more in [Using the client to create profiles and page customizations](devenv-design-profiles-using-client.md).

## Translating profiles

A profile's `Caption` and `ProfileDescription` properties appear in the client user interface. To translate them, generate an XLIFF file and add a translation for each target language. The generated file contains a `<source>` element for each property. Add a `<target>` element with the translated text. Learn more in [Working with translation files](devenv-work-with-translation-files.md).

The following XLIFF example translates the profile from en-US to da-DK. Keep the translation-unit IDs from the file generated for your extension.

```xml
<xliff version="1.2" xmlns="urn:oasis:names:tc:xliff:document:1.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:1.2 xliff-core-1.2-transitional.xsd">
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
        </trans-unit>
      </group>
    </body>
  </file>
</xliff>
```

## Related information

[Developing extensions](devenv-dev-overview.md)  
[AL development environment](devenv-reference-overview.md)  
[Page object](devenv-page-object.md)  
[Page extension object](devenv-page-ext-object.md)  
[Page extension properties](properties/devenv-page-property-overview.md)  
