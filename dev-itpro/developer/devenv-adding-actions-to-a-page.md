---
title: Adding Actions to a Page
description: Create and display actions in the ribbon of all pages and group them together under Actions, Navigate, Reports tabs and preview it in the Windows Client.

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 11/05/2021
ms.topic: conceptual
ms.author: solsen
---

# Adding Actions to a Page

This topic shows how to create new actions, how to add actions to a page, and how to preview them in the [!INCLUDE[d365fin_md](includes/d365fin_md.md)] web client. In [!INCLUDE[d365fin_md](includes/d365fin_md.md)], actions can be displayed in the action bar of all pages and grouped together under the following actions menus: 

- Promoted action categories
- Actions  
- Navigate
- Report

Before putting an action on a page you should think about the business processes that the action supports. For example, on page 42, the Sales Orders list page, the Actions button contains actions for all tasks related to processing sales orders. Creating these actions can make it easier for the order processor to perform their daily tasks, such as posting sales orders and creating new customer orders.  

For more information about different types of actions and where to use them, see [Actions Overview](devenv-actions-overview.md).

> [!TIP]
> After you have added actions to a page, you can use Designer to alter the actions, like moving an action to or from a promoted category, hiding and action or action group, and more. For more information, see [Using Designer](devenv-inclient-designer.md).


## To add Actions to a Page

The page actions are displayed on the header section. There are multiple tabs to help navigate to the right item.
  
In order to add actions to the action bar, you must use the keywords with Anchors or Targets. These keywords are used to place and move the actions around in the tab groups. For more information about adding, moving, and modifying actions, see [Using Keywords to Place Actions and Controls](devenv-page-ext-object.md#using-keywords-to-place-actions-and-controls).

> [!NOTE]  
> Actions can only be linked to a page, or to a group control. Actions cannot be linked to fields, or parts on a page.

## Set an icon to an action
[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] includes images that you can use on actions in command bar menus and promoted actions on the ribbon. To add an image to an action, you add the **Image** property and you must provide the name of the image you that want to use from the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Action icon library. By default, the size of images is 16 pixels high by 16 pixels wide. For promoted actions, you can choose to display larger images that are 32 pixels high and 32 pixels wide. For more information, see [Image Property](properties/devenv-image-property.md).


<!-- For information about adding actions to a CueGroup control, see [Creating a Cue Based on a FlowField](devenv-creating-a-cue-based-on-a-flowfield.md).  -->

### Example

The following example shows how to use different action areas on a **page object of the PageType Card**. These actions will display in the following menus in the action bar.

1. Actions menu: The `area(Processing)` action area is used to display the action in the Actions menu. This action uses the **Promoted** and **PromotedCategory** properties in order to display the action in the promoted actions menu called **Process**.  
  > [!NOTE]  
  > With [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2, the way that you promote actions on pages or page extensions has changed. Promoting actions is defined in a specific section of the page definition and contains a reference to the action. For more information, see [Promoted Actions](devenv-promoted-actions.md).
1. New Document group: The `area(Creation)` action area is used to display the action in the **New document** group in the Actions menu. Also, this action uses the **Image** property to display a form icon instead of a default icon.
1. Navigate menu: The `area(Navigation)` action area is used to display the action in the Navigate tab. This action and other actions in this example uses the **RunObject** property to assign a page to the action.
1. Report menu: The `area(Reporting)` action area is used to display this action in the Report menu, and also a Group control is added as a submenu to this menu. It sets the **Caption** property to make the action group visible in the Reports menu.

```AL
page 50110 PageName
{
    PageType = Card;

    actions
    {
        // Adds the action called "My Actions" to the Action menu 
        area(Processing)
        {
            action("My Actions")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message('Hello World');
                end;
            }
        }

        area(Creation)
        {
            // Adds the action "My New document" to the New Document group in the Actions menu. 
            action("My New document")
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";
                Image = "1099Form";
            }
        }
        
        area(Navigation)
        {
            // Adds the action called "My Navigate" to the Navigate menu. 
            action("My Navigate")
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";
            }
        }

        area(Reporting)
        {
            // Adds a submenu called "My Label" to the Report menu. 
            group(NewSubGroup)
            {
                Caption = 'My label';
                group(MyGroup)
                {
                    // Adds the action "My Report" to the My Label submenu. 
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
> Actions can be assigned to a page by setting the RunObject property, or by adding a trigger to a Codeunit. For more information, see [RunObject Property](properties/devenv-runobject-property.md) and [Codeunit Triggers](triggers-auto/codeunit/devenv-onrun-codeunit-trigger.md).  

The promoted action menus are always displayed first so the promoted actions provide quick access to common tasks, and users don't have to browse through a menu to access them. Add the Promoted property to add actions to the promoted action menu. For more information on how to add promoted actions, promoted categories, and examples, see [Promoted Actions](devenv-promoted-actions.md). 
  
You can assign different icons for your actions from the [!INCLUDE[d365fin_md](includes/d365fin_md.md)] image library. For more information, see [Image Property](properties/devenv-image-property.md). 

## Set up a keyboard shortcut on an action

You can use the [ShortcutKey](properties/devenv-shortcutkey-property.md) property to add a keyboard shortcut to an action. Pressing the key that you set up with this property provides the same result as selecting the action. For example, the following code adds the shortcut Shift+Ctrl+D to an action:

```AL
action(DoThisAction)
{
    ApplicationArea = All;
    ShortCutKey = 'Shift+Ctrl+D';

    trigger OnAction()
    var
    begin
        DoThis();
    end;
}
```

To help you design shortcuts, keep the following information in mind:

- Some shortcuts have default assignments, either defined by the platform or in the base application. Don't reuse shortcuts that are already assigned for different purposes. For a list of these shortcuts, see [Keyboard Shortcuts for the Dynamics 365 Business Central Web Client](/dynamics365/business-central/keyboard-shortcuts). Try to be consistent with shortcuts used across pages, reusing shortcuts for similar actions. 
- Web browsers also support a set of default shortcuts. The shortcuts that you set with the `ShortCutKey` property take precedence and will override the similar shortcuts of the web browser. 
- You can also set up shortcuts on actions of pages contained in parts of the main page. In this case, the shortcuts only work when the user has focus on the part that contains the page. Consider the following behavior when a user presses a shortcut while a page part's in focus:

  - If a shortcut's not defined on the page in the focused part but *is* defined on the main page, the main page's action will be triggered.
  - If a shortcut's defined on the page in the focused part and the main page, the focused part's action is triggered. Shortcut's defined in the part take precedence.  

## See Also  
[Actions Overview](devenv-actions-overview.md)  
[Pages Overview](devenv-pages-overview.md)  
[Promoted Actions](devenv-promoted-actions.md)  