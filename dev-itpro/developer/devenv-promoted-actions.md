---
title: "Promoted Actions"
description: Promoted actions are configured to display on the Home tab for accessing quick daily actions in Dynamics 365 Business Central. 
ms.custom: na
ms.date: 05/05/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
--- 

# Promoted Actions

You can promote actions that are used more often than others and thereby ensure quick access to them. This type of actions are called *promoted actions*. Promoted actions are set up on the Actions, Navigate, or Report menus in the action bar, but are also configured to display on the Home tab. You can, however, choose to hide them on the Actions, Navigate, or Report menus and only show them on the Home tab. 

Promoted actions can be used on list, card, task, and Role Center pages to provide quick access to common tasks that appear under the Home tab. 

## Promoting actions syntax

[!INCLUDE [2022_releasewave2](../includes/2022_releasewave2.md)]

With [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2, the way that you promote actions on pages or page extensions has changed. Promoting actions is defined in a specific section of the page definition and contains a reference to the action.

<!-- The new syntax provides more control over the promoted actions on a page, because they are defined in one section of the page. <!-- more content here --> 

The legacy syntax for defining promoted actions is still supported in releases going forward, but it's recommended to implement the new syntax.

To define promoted actions, you specify an `area(Promoted)` in the `actions` section of a page or a page extension. Inside the `area(Promoted)` section, you can specify one or more `actionref` sections. An `actionref` is an object type that references an action on the page, and by adding it in the promoted area section it's promoted in the UI. You can either create groups in the `area(Promoted)` for the `actionref` references, or you can add `actionref` sections directly. An `actionref` inherits the properties of the referenced action.

<!--
Pages and page extensions can contain an action group for promoted actions. These groups can contain references to existing actions. It is possible to add to existing groups or add new groups in page extensions. End-users can personalize their experience by promoting actions themselves. The platform and client will stay backwards compatible with existing promoted actions property, but a page or page extension must be consistent in its use. There will be a code action to convert from the old model to the new. -->

### Syntax example

This example illustrates a page with the promoted area syntax. In the example the `area(Processing)` section defines the `MyBaseAction` action for the page, which triggers a `Hello world` message. The `MyBaseAction` will be available from under the **Processing** group in the action bar. Furthermore, the `area(Promoted)` defines which actions to promote. The example illustrates that you can group your `actionref` sections, or specify them ungrouped. The `actionref(MyPromotedActionRef; MyBaseAction)` promotes the defined `MyBaseAction` so that it, in addition to being placed in the Processing group, also is promoted for easy access on the page.

```al
page 50105 ActionRefPage
{
    actions
    {
        area(Promoted)
        {
            actionref(MyPromotedActionRef; MyBaseAction)
            {
            }
            group(Group1)
            {
                group(Group2)
                {
                    actionref(MySecondPromotedActionRef; MyBaseAction)
                    {
                    }
                }
            }
        }
        area(Processing)
        {
            action(MyBaseAction)
            {
                Visible = true;
                trigger OnAction()
                begin
                    Message('Hello world!');
                end;
            }
        }
    }
}

```

<!--

	
	- This new promoted area controls all the actions on the "Left Side" of the action bar
	- Usage of the new promoted area and the old syntax in one page is not allowed. If one adds the promoted area to a page all the legacy promotion properties are disallowed(promoted, promotedOnly and… ) 
	- Usage of old syntax pages and new actionRef syntax is allowed in a project 
	

	- An ActionRef is only allowed in the promoted area 

	- An actionRef always needs an action and inherits properties like caption , ….
	- An AcrionRef on a testpage can be invoked the same way as an action 
	- Properties allowed on actionRefs
		○ Visible : controls the visibility of an actionRef
		○ ObsoleteState : specifies the obsoletion state
		○ ObsoleteReason
		○ ObsoleteTag
-->

### Extensibility and compatibility

Switching over to use the new promoted actions syntax can be done gradually as legacy and new syntax will co-exist for a while. We do, however, encourage you to switch over as soon as you can. As you refactor the code, there are a couple of things to be aware of in that process:

- It's not allowed to use both legacy and new syntax for promoted actions on the *same* page or page extension.
- Across a project you can mix legacy and new syntax and:
    - You can implement the `actionref` syntax on a page without breaking any existing page extensions. 
    - You can also write a page extension with the new `actionref` syntax based on a page that uses the legacy syntax.


<!-- 
		○ It gives more control to the page over promoted actions but pageextensions can continue using the old syntax
		
	- Extending a legacy page syntax by a pageextension with ActionRef syntax is supported (V2 on V1)
		○ PageExtension has more control over organizing promoted actions 
		○ In the pageExtension (a virtual ) actionRef is created, the names are formated as <NameOfActions>_Promoted, A pageextension which uses the new syntax have access and control to those promoted actions
		
		pageextension 50100 MyExtension extends MyPage
		{
		    actions
		    {
		        modify(MyAction_Promoted)
		        {
		            Visible = false;
		        }
		        addfirst(Promoted)
		        {
		            actionref(MyPromotedAction; MySecondAction)
		            {
		            }
		        }
		    }
		}
		
		
	- If there is no changes in Page and PageExtensions (V1 on V1) those pages continue to work as before but we encourage you to convert your pages 
	
	- A developer can unlock all the features and control by converting both a page and pageExtensions that expand that page(V2 on V2)
-->

## Promoting actions by category (legacy syntax)

> [!NOTE]  
> The following section describes the former way of defining promoted actions for [!INCLUDE[prod_short](includes/prod_short.md)]. It's recommended to switch to the `ActionRef` syntax for defining promoted actions.

You can promote any command from the existing actions menus to the ribbon. If there are no promoted actions, the ribbon remains hidden. To promote an action on the Home tab, you set the **Promoted** property of the action. If you want to display the action only on the Home tab, then you add an extra step to set the **PromotedOnly** property. For more information, see [Promoted Property](properties/devenv-promoted-property.md) and [PromotedOnly Property](properties/devenv-promotedonly-property.md). <!---->

Promoted actions can be grouped. You can add promoted actions by different grouped categories. Typically, promoted actions are displayed in the ribbon of the role center client. You can organize promoted actions into different categories, where each category is indicated by a caption in the ribbon. You define up to 10 categories for a page. The following figure illustrates a page that has promoted actions under the following categories. 

- New Document
- Request Approval
- Customer

![image text.](media/Promoted-Category-V2.png)


You assign a promoted action to a category by setting the **PromotedCategory** property of the action. By default, these category names correspond to the captions that are displayed for the category on the page in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. You'll typically want to change the captions, especially the Category4 through Category10 captions. See the table below for the default **PromotedCategory** values. To change the default captions, set the **PromotedActionCategories** property. 
You type the values of the **PromotedActionCategories** where each caption is separated with a comma as shown below: 

```AL
PromotedActionCategories = 'New_caption,Process_caption,report_caption,category4_caption,category5_caption,category6_caption,category7_caption,category8_caption,category9_caption,category10_caption';
```

The position of the caption in the list determines its corresponding category setting in the **PromotedCategory** property for the actions as described in the table below.

| PromotedActionCategories caption position|Default PromotedCategory values  |  Example |
|--------------------| ----------------------|-----------|
|First |New       | *New_caption*  | 
|Second|Process    | *Process_caption* |
| Third |Report   | *Report_caption* | 
|Fourth |Category4    | *Category4_caption* |
| Fifth | Category5   | *Category5_caption* |
| Sixth|Category6   | *Category6_caption* |
| Seventh|Category7   | *Category7_caption* |
|Eighth|Category8   | *Category8_caption* |
| Ninth |Category9  | *Category9_caption* |
|Tenth|Category10  | *Category10_caption* |

You can change category captions on a page-by-page basis and for each [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Windows client language. 

For more information about these properties, see [PromotedCategory Property](properties/devenv-promotedcategory-property.md) and [PromotedActionCategories Property](properties/devenv-promotedactioncategories-property.md).

## Assigning an icon to the promoted actions

Each promoted action has an icon associated with it. You can accept a default icon, or choose your own from the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] image library by using the **Image** property, where each promoted action has an icon associated with it. Also, you can use a larger icon that makes it more prominent to the user by using the **PromotedIsBig** property. For more information, see [Image Property](properties/devenv-image-property.md) and [PromotedIsBig Property](properties/devenv-promotedisbig-property.md).

### Example 
The example shows how to promote actions on a Customers page using different properties: 
1. The actions in the example are promoted to display in the **New Document**, **Request Approval** and **Customer** groups on the Home tab. 
1. The **Sales Quote** and **Sales Invoice** actions are promoted to the ribbon and grouped in a category called **New Document**. 
2. The `PromotedCategory` value; `Category5` corresponds the caption position in the `PromotedActionCateogories` value with the **New Document** caption. 
3. Each promoted action in the example is assigned to a unique icon. Additionally, to display bigger icons, the **Sales Quote** and **Contact** actions are set with the `PromotedIsBig` property. 
4. The **Sales Quote** and **Send Approval Request** actions are set to appear only on the Home tab.

```AL
page 50103 Customers
{
    PageType = Card;
    SourceTable = Customer;
    PromotedActionCategories = 'New,Process,Report,Manage,New Document,Request Approval,Customer,Page';

    actions
    {
        area(Creation)
        {
            action("Sales Quote")
            {
                Promoted = true;
                PromotedCategory = Category5;  // PromotedActionCategories = New Document
                PromotedOnly = true;
                PromotedIsBig = true;
                Image = NewSalesQuote;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message('Create sales quote');
                end;
            }
            action("Sales Invoice")
            {
                Promoted = true;
                PromotedCategory = Category5;  // PromotedActionCategories = New Document
                Image = SalesInvoice;
                ApplicationArea = All;
                trigger OnAction()
                begin
                end;
            }
        }
        area(Processing)
        {
            action("Send Approval Request")
            {
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Category6;  // PromotedActionCategories = Request Approval
                Image = SendApprovalRequest;
                ApplicationArea = All;
                trigger OnAction()
                begin
                end;
            }
            action("Cancel Approval Request")
            {
                Promoted = true;
                PromotedCategory = Category6;  // PromotedActionCategories = Request Approval
                Image = CancelApprovalRequest;
                ApplicationArea = All;
                trigger OnAction()
                begin
                end;
            }
        }
        area(Navigation)
        {
            action(Contact)
            {
                Promoted = true;
                PromotedCategory = Category7;  // PromotedActionCategories = Customer
                PromotedIsBig = true;
                Image = CustomerContact;
                ApplicationArea = All;
                trigger OnAction()
                begin
                end;
            }
            action("Account Details")
            {
                Promoted = true;
                PromotedCategory = Category7;  // PromotedActionCategories = Customer
                Image = Account;
                ApplicationArea = All;
                trigger OnAction()
                begin
                end;
            }
        }
    }
}
```

For more examples of how to use actions, see [Page Object](devenv-page-object.md) and [Page Extension Object](devenv-page-ext-object.md).

## See Also
[Actions Overview](devenv-actions-overview.md)  
[Adding Actions to a Page](devenv-adding-actions-to-a-page.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions in AL](devenv-dev-overview.md)  
[Pages Overview](devenv-pages-overview.md)  