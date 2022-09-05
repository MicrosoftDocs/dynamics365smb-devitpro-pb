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

## Promoted actions using the actionref syntax

[!INCLUDE [2022_releasewave2](../includes/2022_releasewave2.md)]

With [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2, the way that you promote actions on pages or page extensions has changed. Promoting actions is defined in a specific section of the page definition and contains a reference to the action.

In [!INCLUDE [prod_short](includes/prod_short.md)] the new action bar is enabled when the feature flag **Modern Action Bar** on the **Feature Management** page is set to *Enabled*. The flag can be switched off to simulate legacy behavior, but the promoted action code in the base application uses the `actionref` syntax.

The new syntax provides more visibility in code, because the promoted actions are grouped in a separate section. And to the end user, the personalization experience is improved, adding options for promoting actions. 

> [!NOTE]  
> To enable personalization of the promoted area of the action bar, you must use the `actionref` syntax described below.

> [!NOTE]  
> The [legacy syntax](devenv-promoted-actions.md#promoting-actions-by-category-legacy-syntax) for defining promoted actions is still supported in releases going forward, but it's recommended to implement the new syntax.

To define promoted actions, you specify an `area(Promoted)` in the `actions` section of a page or a page extension. Inside the `area(Promoted)` section, you can specify one or more `actionref` sections. An `actionref` is an object type that references an action on the page, and by adding it in the promoted area section it's promoted in the UI. An `actionref` can only be defined in the `area(Promoted)` section. You can either create groups in the `area(Promoted)` for the `actionref` references, or you can add `actionref` sections directly. An `actionref` inherits the properties of the referenced action. For page extensions, you can add to existing groups and you can add new groups. 

### Split buttons for actions

Split buttons can help organize the actions that you are promoting. A split button can be defined for a page action group, which renders as a combination of a button and a menu. Use the `ShowAs` property to specify that a certain page action group should render as a split button. For more information, see [ShowAs Property](properties/devenv-showas-property.md).

### Syntax example

This example illustrates a page with the promoted area syntax. In the example the `area(Processing)` section defines the `MyBaseAction` action for the page, which triggers a `Hello world` message. The `MyBaseAction` will be available from under the **Processing** group in the action bar and it will be promoted because it is added to the `area(Promoted)` section, which defines the actions to promote. The example illustrates that you can group your `actionref` sections, or specify them ungrouped. The `actionref(MyPromotedActionRef; MyBaseAction)` promotes the defined `MyBaseAction` so that it, in addition to being placed in the **Processing** group, also is promoted for easy access on the page.<!--?? check with deprecation and new behavior -->. Also, the example illustrates using a split button for `Group2` where two `actionref`s 

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
                actionref(MySecondPromotedActionRef; MyBaseAction)
                {
                }
            }

            group(Group2)
            {
                ShowAs = SplitButton;

                actionref(MySplitButtonPromotedActionRef; MyBaseAction)
                {
                }
                
                actionref(MyOtherSplitButtonPromotedActionRef; MyBaseAction)
                {
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

### Extensibility and compatibility

Switching over to use the new promoted actions syntax can be done gradually as legacy and new syntax will co-exist for a while. We do, however, encourage you to switch over as soon as you can. As you refactor the code, there are a couple of things to be aware of in that process:

- It's not allowed to use both legacy and new syntax for promoted actions on the *same* page or page extension. This means that if you add `actionref` syntax to your code, the `Promoted` properties (`Promoted`, `PromotedOnly`, `PromotedActionCategories`, and `PromotedCategory`) will not be allowed.
- Across a project you can mix legacy and new syntax and:
  - You can implement the new `actionref` syntax on a page without breaking any existing page extensions. 
  - You can write a page extension with the new `actionref` syntax based on a page that uses the legacy syntax.

A code action for converting pages using legacy syntax is available with [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2. The code action can be applied to a narrow or broader scope of code. For more information, see [AL Code Actions](devenv-code-actions.md).

## Promoting actions by category (legacy syntax)

> [!NOTE]  
> The following section describes the former way of defining promoted actions for [!INCLUDE[prod_short](includes/prod_short.md)]. It's recommended to switch to the `actionref` syntax for defining promoted actions.

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