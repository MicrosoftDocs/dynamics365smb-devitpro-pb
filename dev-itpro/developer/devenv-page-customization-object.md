---
title: "Page Customization Object"
description: "Description of the page customization object."
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

# Page Customization Object
The page customization object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] allows you to add changes to the page layout and actions. The page customization object has more restrictions than the [page extension object](devenv-page-ext-object.md); when you define a new page customization object, you cannot add variables, procedures, or triggers. 

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.     

## Snippet support
Typing the shortcut ```tpagecust``` will create the basic layout for a page customization object when using the AL Extension in Visual Studio Code.

## Page customization example
The following page customization example `MyCustomization` is intialized to perform changes to **Customer List**. By using the `moveafter` method, `Blanket Orders` is moved next to the `Aged Accounts Receivable` action item. And the `modify` method is used to hide the `NewSalesBlanketOrder` action item. 


```
pagecustomization 70000123 MyCustomization customizes "Customer List"
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
