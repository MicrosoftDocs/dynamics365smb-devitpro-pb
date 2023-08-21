---
title: "Page customization object"
description: "Description of the page customization object in AL for Business Central    ."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/21/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
---

# Page customization object

The page customization object in [!INCLUDE [prod_short](includes/prod_short.md)] allows you to add changes to the layout and actions on page that are accessible for a profile. See [Using keywords to place actions and controls](devenv-page-ext-object.md#using-keywords-to-place-actions-and-controls) for how to place actions and controls on a page customization object.

The page customization object has more restrictions than the [page extension object](devenv-page-ext-object.md); when you define a new page customization object, you cannot add variables, procedures, or triggers. 

> [!NOTE]  
> A single page customization can be used with multiple profiles within the same extension. Page customizations only apply to the RoleCenters they are specified for. In order to view or changes the RoleCenters in the client, go to **My Settings**, and then choose **Role Center**. 

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!NOTE]  
> Modifying actions in Cue groups on page extensions is not supported.

> [!NOTE]  
> The property `allowDebugging`, which is a setting under `resourceExposurePolicy` doesn't apply to page customizations. Page customizations defined in an extension with `allowDebugging` set to `false` can still be copied using Designer. For more information, see [Resource Exposure Policy Setting](devenv-security-settings-and-ip-protection.md).


## Snippet support

Typing the shortcut `tpagecust` creates the basic layout for a page customization object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Views

Views in [!INCLUDE [prod_short](includes/prod_short.md)] are used on list pages to define a different view of the data on a given page. Views can be defined for [Pages](devenv-page-object.md), [Page Extensions](devenv-page-ext-object.md), and [Page Customization](devenv-page-customization-object.md). For more information, see [Views](devenv-views.md).


## Page customization example

The following page customization example `MyCustomization` makes changes to **Customer List**. By using the `moveafter` method, `Blanket Orders` is moved after the `Orders` action item. And the `modify` method is used to hide the `NewSalesBlanketOrder` action item.

```AL
profile TheBoss
{
    Description = 'The Boss';
    RoleCenter = "Business Manager Role Center";
    Customizations = MyCustomization;
    Caption = 'Boss';
}

pagecustomization MyCustomization customizes "Customer List"
{
    actions
    {
        moveafter(Orders; "Blanket Orders")

        modify(NewSalesBlanketOrder)
        {
            Visible = false;
        }

    }
}
```

You can use the same page customization on another profile within the same extension package by referencing its name from the profile definition, for example:

```AL
profile TheSalesman
{
    ProfileDescription = 'The Boss';
    RoleCenter = "Sales Manager Role Center";
    Customizations = MyCustomization;
    Caption = 'Salesman';
}
```

## Adding groups and page fields based on table fields

With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 2, we have added the ability to add groups and page fields using a table field as source expression in page customizations as illustrated in the following example:

```al
pagecustomization MyPageCust customizes MyPage
{
    layout
    {
        addfirst(Content)
        {
            field(MyPageCustField; Rec.MyTableField) {...}
        }
    }
}
```

To specify if a table field can be used as a source expression for page fields that are created in page customizations, use the [AllowInCustomizations](properties/devenv-allowincustomizations-property.md). Default is that a table field can be used in such a way.


## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Object](devenv-page-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Views](devenv-views.md)  
[Page, Page Fields, and Page Extension Properties](properties/devenv-page-property-overview.md)  
