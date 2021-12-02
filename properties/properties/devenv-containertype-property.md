---
title: "ContainerType Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9765a761-62d2-4343-9e5c-73cb01b887b0
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

# ContainerType Property

Sets the container type when you want to add one of the following controls to a page:  
  
- Container  
- Group  
- Field   
- Part  
  
## Applies to  
  
- Container controls on Pages  

## Syntax

```AL
page 50100 MyPage
{
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            ...
        }

        area(FactBoxes)
        {
            ...
        }

        area(Content)
        {
            ...
        }
    }
}
```
  
## Remarks

A Container control methods as a high-level container for other page controls. You can choose from one of the following subtypes:  
  
|Value|Description|  
|-----|-----------|  
|ContentArea|Specifies the main content area of the page. A page can only have one **ContentArea** control. Except for Role Center pages, pages will have a **ContentArea** container as the first control in Page Designer.|  
|FactBoxArea|Specifies a FactBox area on the page. A FactBox is an area that is located along the right-side of the page that contains one or page parts.|  
|RoleCenterArea|Specifies the main content area for a RoleCenter page type.|  
   
## See Also

[Properties](devenv-properties.md)