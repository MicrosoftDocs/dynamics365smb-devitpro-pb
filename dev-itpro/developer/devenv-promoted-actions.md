---
title: "Defining Promoted Actions"
ms.custom: na
ms.date: 06/06/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: cb249654-c9be-482b-9a25-c26d7f229fc2
caps.latest.revision: 44
author: SusanneWindfeldPedersen
--- 

# Promoted Actions
Promoted actions are actions that are set up on the Actions, Navigate, or Reports tabs in the ribbon, but are also configured to display on the Home tab. Although the actions are set up on the Action, Navigate, or Report tabs, you can choose to hide them on these tabs and only show them on the Home tab. 


The following table describes where you can use promoted actions.

|Action type|Used on|Description|Example|  
|----------------|--|-------|-----------|-------| 
|Promoted Actions|List, card, Role Center pages, and task pages|Provide quick access to common tasks that appear under the Home tab.|Post and print a sales order|

You can promote any command from the existing actions menus to the ribbon. If there are no promoted actions, the ribbon remains hidden. For more information, see [Promoted Property](properties/devenv-promoted-property.md).

## Promote actions by category
Promoted actions can be grouped. You can add promoted actions by different grouped categories. Typically, promoted actions are displayed in the ribbon of the role center client. You can organize promoted actions into different categories, where each category is indicated by a caption in the ribbon. You define up to 10 categories for a page.

- Manage
- Process
- Report
- New Document

You assign a promoted action to a category by setting the [PromotedCategory Property](properties/devenv-promotedcategory-property.md) of the action. You can choose among the following categories:

- Process
- Report
- Creation
- Category4
- Category5
- Category6
- Category7
- Category8
- Category9
- Category10

By default, these category names correspond to the captions that are displayed for the category on the page in the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Windows client. You will typically want to change these captions, especially the Category4 through Category10 captions.

You change category captions on a page-by-page basis and for each [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Windows client language.

## Assigning an icon to the promoted actions
  
Each promoted action has an icon associated with it. You can accept a default icon for your promoted action or decide to use a larger icon that makes it more prominent to the user. Use the Properties window in the Action Designer to set the size and location of an icon. For more information, see [Image Property](properties/devenv-image-property.md).

### Example 
On the Sales Orders list page, Post is promoted to the ribbon, and included in the Process group. This helps the order processor in her work, because posting sales orders is one of her most important daily tasks. For examples of how to use actions, see [Page Object](devenv-page-object.md) and [Page Extension Object](devenv-page-ext-object.md).

```
page 50100 "Sales Orders List"
{
    PageType = Card;
 
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                Promoted = true;
                
                trigger OnAction()
                begin
                    Message('My promoted action');
                end;
            }
        }
    }
}
```
## See Also
[Actions Overview](devenv-actions-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions in AL](devenv-dev-overview.md)  
[Pages Overview](devenv-pages-overview.md)  