---
title: Page Actions Overview in Business Central
description: Learn how to organize Business Central page actions into menus and groups so that users can find tasks, open pages, and run reports or flows.
ms.date: 05/15/2025
ms.topic: overview
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Actions overview

On many page types in [!INCLUDE [prod_short](includes/prod_short.md)], the action bar at the top of the page displays actions. Dialogs and part pages have specialized action layouts. Some page types don't support page actions. This article explains how to organize actions so that users can quickly find the tasks they need.

The actions can be displayed in different menus on the action bar.

:::image type="content" source="media/action-overview.png" alt-text="Screenshot of a Business Central page with action menus and promoted actions in the action bar.":::

You can choose from the following action menus to place the actions in the specified area.

|Area |Syntax| Used on|Description|Example|
|---------------|--|-------|-----------|-------|
| Actions menu | `area(processing)` | Role center, list, card, and task pages | User tasks | Post a sales order |
| New document group in Actions menu | `area(creation)` | List, card, role center, and task pages | Actions for creating new records or documents. Menu labels and placement depend on the client layout. | New sales invoice |
| Related-information menu | `area(navigation)` | List, card, and task pages | Links to other pages in [!INCLUDE [prod_short](includes/prod_short.md)]. | Prices |
| Reports menu | `area(reporting)` | Role center, list, card, and task pages | A list of available reports. | Customer Top 10 List |

The following actions are related to the role center page.

|Area |Syntax |Used on |Description |Example |
|-----|----------------|-------|-----------|-------|
| Navigation menus | `area(sections)` | Role center pages | The top-level navigation consists of one or more root items that expand to display a submenu of links to other pages. | Posted sales invoices |
| Navigation bar | `area(embedding)` | Role center pages | The second-level navigation displays a flat list of links to other pages. | Customers |

Learn more about actions on the role center page in [Designing role centers](devenv-designing-role-centers.md).

## Types of actions

The actions available on a page depend on the page type and the processes it supports. To create the right set of actions, understand your customer's business processes.

Each process in an organization has several actions associated with it. Create actions that cover the tasks and processes users perform.

For example, the **Sales Orders** list page includes sales-order processing actions. Use profile customization and personalization to hide or promote some actions in the action bar. Provide the actions the customer needs, even if some users choose to hide them.

Pages can have the following actions as described in each of the following sections.

## Actions menu

On pages that support it, the **Actions** menu contains tasks relevant to the current page. Use the `processing` action area for processing tasks, such as posting a sales order. Use the `creation` action area for creating records or documents. Learn more in [Adding actions to a page](devenv-adding-actions-to-a-page.md).

Some creation actions on the **Customer** page are:

- **Sales Quote**
- **Sales Order**
- **Sales Invoice**
- **Sales Credit Memo**

You can add actions to the **Actions** menu, group them into submenus, or promote them in the action bar. Learn more in [Page object](devenv-page-object.md) and [Page extension object](devenv-page-ext-object.md).

<a name="new-document-menu"></a>

### Actions for creating documents

Creation actions are grouped for creating new records or documents, such as a sales invoice. Their menu label and placement depend on the client layout. Use the `creation` action area to define these actions.

For example, an order processor can create a new invoice directly from the **Customers** page. This setup provides quick access to a common daily task.

<!-- ### Home Items
 Home Items are actions that appear under the Home button, on the Role Center navigation pane. This navigation has a tree structure, and each node in the tree links to a list page.

 The user Role Center is like a home page, and home items in the navigation pane are links to the user's most useful list pages. Learn more about current role center navigation in [Add menus to navigation and action areas](devenv-adding-menus-to-navigation-pane.md). -->

<a name="navigate-menu"></a>

## Navigation to related information

The related-information menu contains navigation actions that open specific pages in [!INCLUDE [prod_short](includes/prod_short.md)]. Use the `navigation` action area to add these page links. They provide quick access to related information. <!-- Learn more about current navigation actions in [Adding actions to a page](devenv-adding-actions-to-a-page.md). -->

> [!NOTE]
> Don't add a `navigation` action area to a role center page.

<a name="report-menu"></a>

## Actions for running reports

The **Reports** menu lists reports relevant to a page. The menu is hidden when it has no visible actions. Promote frequently used reports in the action bar to make them easier to find. Use the `reporting` action area to define report actions.

 <!--
### Activity buttons  
If there are too many Home items to fit on the Role Center without scrolling, use activity buttons to group other important processes together.  

Example: The Order Processor Role Center could have activity buttons called Approving Web Orders or Sales Forecasting. These activities are secondary for the order processor, so you don't need to include them under the Home button.  

Each activity button has its own navigation pane with links to list pages and can be configured just like the user Role Center.  

 Learn more about current role center navigation in [Add menus to navigation and action areas](devenv-adding-menus-to-navigation-pane.md). -->

## Promoted actions

> [!NOTE]
> With [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2, the way that you promote actions on pages or page extensions has changed. Define promoting actions in a specific section of the page definition. This section contains a reference to the action. Learn more in [Promoted actions](devenv-promoted-actions.md).

Promoted actions are defined in the processing, creation, navigation, or reporting areas and referenced by promoted action groups. You can keep an action in its original menu or show it only in its promoted location. Use promoted actions on Card, Document, List, ListPlus, and Worksheet pages to provide quick access to common tasks. Place them in the appropriate action-bar groups.


<!--
### Home menu
The Home menu is always displayed first so promoted actions provide quick access to common tasks, because users do not have to browse through a menu to access them. You can promote any command from the existing actions menus to the ribbon. If there are no promoted actions, the ribbon remains hidden. For more information, see [Promoted Property](properties/devenv-promoted-property.md).
-->

## Run Power Automate flows from page actions

[!INCLUDE [2022_releasewave2](../includes/2022_releasewave2.md)]

With [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2, it's possible to define page actions that trigger a Power Automate instant flow by using custom actions. Custom actions are defined next to other actions, but use the `customaction` keyword instead. The syntax is as follows:

```al
customaction(MyFlowAction)
{
    CustomActionType = Flow;
    FlowId = '<FlowId>';
    FlowEnvironmentId = '<FlowEnvironmentId>';

}
```

For an action that runs an existing instant flow, set the [CustomActionType property](properties/devenv-customactiontype-property.md) to `Flow`. Set the [FlowId property](properties/devenv-flowid-property.md) to the flow's ID. Set the [FlowEnvironmentId property](properties/devenv-flowenvironmentid-property.md) to identify its Power Automate environment. Replace the placeholders in the following example with your flow's values.

> [!TIP]
> Get the flow and environment IDs in Power Automate. Sign in to [Power Automate](https://powerautomate.com) and open the flow for editing. In the browser URL, find the environment ID after `/environments/` and the flow ID after `/flows/`. These segments have the form `https://make.powerautomate.com/environments/<FlowEnvironmentId>/flows/<FlowId>`.

Learn more about Power Automate flows in [Power Automate integration overview](../powerplatform/power-automate-overview.md).

## Grouping actions in submenus

Within an action area, use a `group()` control to organize actions into submenus. The following fragment preserves two nested groups and three report actions. The first and third actions run the same report to illustrate the menu structure. Add the fragment to a page's definition.

```AL
actions
{
    area(Reporting)
    {
        action("Report 1")
        {
            ApplicationArea = All;
            Caption = 'Report 1';
            RunObject = report "Standard Sales - Invoice";
            ToolTip = 'Run the sales invoice report.';
        }

        group(Group1)
        {
            Caption = 'Group1';
            action(Action2)
            {
                ApplicationArea = All;
                Caption = 'Report 2';
                RunObject = report "Customer/Item Sales";
                ToolTip = 'Run the customer item sales report.';
            }
            group(Group2)
            {
                Caption = 'Group2';
                action(Action3)
                {
                    ApplicationArea = All;
                    Caption = 'Report 3';
                    RunObject = report "Standard Sales - Invoice";
                    ToolTip = 'Run the sales invoice report.';
                }
            }
        }
    }
}
```

> [!NOTE]
> Before [!INCLUDE [prod_short](includes/prod_short.md)] 2019 Wave 2, the client automatically placed submenus before single actions on the same level. This placement means, for example, group **Group2** appears before the action **Report 2**.

## Actions at runtime

An action can run code that posts a document or modifies table records. After the action, the client refreshes the current source record when applicable:

- If no records remain, the page initializes a record from the filters.
- If the current record remains within the filters, `OnAfterGetRecord` can run for that record.
- If the current record moves outside the filters, the page uses `OnNextRecord` to move to another record. If the move succeeds, `OnAfterGetRecord` runs for that record.

`OnAfterGetRecord` can also run before the action.

The logic runs in the transaction that the action triggered. This behavior can cause the application code to lock the whole table when users thought they were only modifying one record.  

Use [SetSelectionFilter](methods-auto/page/page-setselectionfilter-method.md) to pass selected records to processing code. Locking still depends on the operations and triggers that code executes. The following [OnAction](triggers-auto/action/devenv-onaction-action-trigger.md) fragment requires a custom processing codeunit with ID `50000` that accepts the page's record type.

```AL
if confirm('Are you sure you want to call this codeunit?', true) then begin
    CurrPage.SetSelectionFilter(Rec);
    codeunit.Run(50000, Rec);
end;
```

## Related information

[AL development environment](devenv-reference-overview.md)  
[Developing extensions in AL](devenv-dev-overview.md)  
[Pages overview](devenv-pages-overview.md)  
[Promoted actions](devenv-promoted-actions.md)  
