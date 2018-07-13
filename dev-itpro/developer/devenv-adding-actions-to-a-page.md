---
title: Adding Actions to a Page
description: Create and display actions in the ribbon of all pages and group them together under Actions, Navigate, Reports tabs and preview it in the Windows Client.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/08/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
caps.latest.revision: 11
ms.author: solsen
---
# Adding Actions to a Page 
This topic shows how to create new actions, how to add actions to a page, and how to preview them in the [!INCLUDE[d365fin_md](includes/d365fin_md.md)] web client. In [!INCLUDE[d365fin_md](includes/d365fin_md.md)], actions can be displayed in the ribbon of all pages and grouped together under the following actions tabs: 

- Home
- Actions  
- Navigate
- Report

Before putting an action on a page you should think about the business processes that the action supports. For example, on page 42, the Sales Orders list page, the Actions button contains actions for all tasks related to processing sales orders. Creating these actions can make it easier for the order processor to perform their daily tasks, such as posting sales orders and creating new customer orders.  

For more information about different types of actions and where to use them, see [Actions Overview](devenv-actions-overview.md).  

## To add Actions to a Page
The page actions are displayed on the header section. There are multiple tabs to help navigate to the right item.   
  
In order to add actions to the ribbon, you must use the keywords with Anchors or Targets. These keywords are used to place and move the actions around in the tab groups. For more information about adding, moving, and modifying actions, see [Using Keywords to Place Actions and Controls](devenv-pages-overview.md#using-keywords-to-place-actions-and-controls).

> [!NOTE]  
>  Actions can only be linked to a page, or to a group control. Actions cannot be linked to fields, or parts on a page. 

## Set an icon to an action
[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] includes images that you can use on actions in command bar menus and promoted actions on the ribbon. To add an image to an action, you add the **Image** property and you must provide the name of the image you that want to use from the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Action icon library. By default, the size of images is 16 pixels high by 16 pixels wide. For promoted actions, you can choose to display larger images that are 32 pixels high and 32 pixels wide. For more information, see [Image Property](properties/devenv-image-property.md).


<!-- For information about adding actions to a CueGroup control, see [Creating a Cue Based on a FlowField](devenv-creating-a-cue-based-on-a-flowfield.md).  -->

### Example 
The following example shows how to use different action areas on a card PageType. These actions will display in the following menu tabs.

1. Actions menu: The `area(Processing)` action area is used to display the action in the Actions tab. This action uses the **Promoted** property in order to display the action in the Home tab too. 
2. New Document group: The `area(Creation)` action area is used to display the action in the **New document** group in the Actions tab. Also, this action uses the **Image** property to display a form icon instead of a default icon. 
3. Navigate menu: The `area(Navigation)` action area is used to display the action in the Navigate tab. This action and other actions in this example uses the **RunObject** property to assign a page to the action. 
4. Report menu: The `area(Reporting)` action area is used to display this action in the Report tab, and also a Group control is added as a submenu to this menu tab. It sets the **Caption** property to make the action group visible in the Reports tab.

```
page 50110 PageName
{
    PageType = Card;

    actions
    {
        area(Processing)
        {
            action("My Actions")
            {
                Promoted = true;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message('Hello World');
                end;
            }
        }

        area(Creation)
        {
            action("My New document")
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";
                Image = "1099Form";
            }
        }
        
        area(Navigation)
        {
            action("My Navigate")
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";
            }
        }

        area(Reporting)
        {
            group(NewSubGroup)
            {
                Caption = 'My label';
                group(MyGroup)
                {
                    action("My Report")
                    {
                        ApplicationArea = All;
                        RunObject = page "Customer Card";
                    }
                }
            }
        }
    }
}
``` 

> [!NOTE]  
> Actions can be assigned to a page by setting the RunObject property, or by adding a trigger to a Codeunit. For more information, see [RunObject Property](properties/devenv-runobject-property.md) and [Codeunit Triggers](triggers/devenv-codeunit-triggers.md).  

The Home tab is always displayed first so the promoted actions provide quick access to common tasks, and users do not have to browse through a menu to access them. Add the Promoted property to add actions to the Home tab. For more information on how to add promoted actions, promoted categories and examples, see [Promoted Actions](devenv-promoted-actions.md). 
  
You can assign different icons for your actions from the [!INCLUDE[d365fin_md](includes/d365fin_md.md)] image library. For more information, see [Image Property](properties/devenv-image-property.md). 
  
## See Also  
[Actions Overview](devenv-actions-overview.md)  
[Pages Overview](devenv-pages-overview.md)  
[Promoted Actions](devenv-promoted-actions.md)  