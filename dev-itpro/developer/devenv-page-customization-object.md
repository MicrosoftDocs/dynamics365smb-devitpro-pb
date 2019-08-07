---
title: "Page Customization Object"
description: "Description of the page customization object."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/07/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Page Customization Object
The page customization object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] allows you to add changes to the page layout and actions. The page customization object has more restrictions than the [page extension object](devenv-page-ext-object.md); when you define a new page customization object, you cannot add variables, procedures, or triggers. 

> [!NOTE]  
> Page customizations only apply to the RoleCenter they are specified for. In order to see them, in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] under **Settings**, **Profile** change the profile to that specific RoleCenter that a page customization is defined for.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.     

## Snippet support
Typing the shortcut `tpagecust` will create the basic layout for a page customization object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Page customization example
The following page customization example `MyCustomization` makes changes to **Customer List**. By using the `moveafter` method, `Blanket Orders` is moved next to the `Aged Accounts Receivable` action item. And the modify method is used to hide the `NewSalesBlanketOrder` action item.

```
profile TheBoss
{
    Description = 'The Boss';
    RoleCenter = "Business Manager";
    Customizations = MyCustomization;
}

pagecustomization MyCustomization customizes "Customer List"
{
    actions
    {
        moveafter("Blanket Orders"; "Aged Accounts Receivable")

        modify(NewSalesBlanketOrder)
        {
            Visible = false;
        }
        
    }
}
```


## See Also
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Object](devenv-page-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Extension Properties](properties/devenv-page-property-overview.md)   
