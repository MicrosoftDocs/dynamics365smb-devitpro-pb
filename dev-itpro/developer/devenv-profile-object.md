---
title: "Profile Object"
description: "Description of the page object."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Profile Object
The profile object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] allows you to build an individual experience for each user profile. Profile object performs a validatation to check whether the specified role center page exists, and [page customization objects](devenv-page-customization-object.md) exists, when you define a new profile object. You can add changes to the page layout, and actions; but you cannot add variables, procedures, or triggers. 

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.      

## Snippet support
Typing the shortcut ```tprofile``` will create the basic layout for a profile object when using the AL Extension in Visual Studio Code.

## Profile object example
The following profile object example performs a validation to check if the `Business Manager` page of type RoleCenter exists, and if `MyCustomization` exists, and if it is a page customization object. Then the page customization modifies the layout of the **Customer List** to make the `Name` field invisible using the `modify` method. 

```
profile TheBoss 
{
    Description = 'The Boss';
    RoleCenter = "Business Manager";
    Customizations = MyCustomization;
}

pagecustomization MyCustomization customizes "Customer List"
{
    layout
    {
        modify(Name) {
            Visible = false;
        }
    }
}

```

## See Also  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Pages Overview](devenv-pages-overview.md)  
[Page Customization Object](devenv-page-customization-object.md)
