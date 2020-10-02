---
title: "Promoted Actions"
description: Promoted actions are actions that are configured to display on the Home tab for accessing quick daily actions in Dynamics 365 Business Central. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
--- 

# Promoted Actions
Promoted actions are actions that are set up on the Actions, Navigate, or Report menus in the action bar, but are also configured to display on the Home tab. Although the actions are set up on the Actions, Navigate, or Report tabs, you can choose to hide them on these menus and only show them on the Home tab. 

The following table describes where you can use promoted actions.

|Action type|Used on|Description|Example|  
|----------------|-------|-----------|-------| 
|Promoted Actions|List, card, Role Center pages, and task pages|Provide quick access to common tasks that appear under the Home tab.|Post and print a sales order|

You can promote any command from the existing actions menus to the ribbon. If there are no promoted actions, the ribbon remains hidden. To promote an action on the Home tab, you set the **Promoted** property of the action. If you want to display the action only on the Home tab, then you add an additional step to set the **PromotedOnly** property. For more information, see [Promoted Property](properties/devenv-promoted-property.md) and [PromotedOnly Property](properties/devenv-promotedonly-property.md).

## Promote actions by category
Promoted actions can be grouped. You can add promoted actions by different grouped categories. Typically, promoted actions are displayed in the ribbon of the role center client. You can organize promoted actions into different categories, where each category is indicated by a caption in the ribbon. You define up to 10 categories for a page. The following figure illustrates a page that has promoted actions under the following categories. 

- New Document
- Request Approval
- Customer

![image text](media/Promoted-Category-V2.png)


You assign a promoted action to a category by setting the **PromotedCategory** property of the action. By default, these category names correspond to the captions that are displayed for the category on the page in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. You will typically want to change the captions, especially the Category4 through Category10 captions. See the table below for the default **PromotedCategory** values. To change the default captions, set the **PromotedActionCategories** property. 
You type the values of the **PromotedActionCategories** where each caption is separated with a comma as shown below: 

```
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

```
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