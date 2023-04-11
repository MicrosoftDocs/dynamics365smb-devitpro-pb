---
title: "Actions Overview"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cb249654-c9be-482b-9a25-c26d7f229fc2
caps.latest.revision: 44
---
# Actions Overview
In [!INCLUDE[navnow](includes/navnow_md.md)], actions are displayed at the top of each page in the ribbon or in the navigation pane. In this topic, you learn about different types of actions, and how you can enable users to quickly locate the actions they want to use.  
  
 Pages can have the following actions.  
  
|Types of actions|Used on|Description|Example|  
|----------------------|-------------|-----------------|-------------|  
|Actions|Role Center, list, card, and task pages|User tasks|Post a sales order|  
|Navigate|List, card, and task pages|Links to other pages in [!INCLUDE[navnow](includes/navnow_md.md)].|Prices|  
|Reports|Role Center, list, card, and task pages|A list of available reports.|Customer Top 10 List|  
|New|List, card, Role Center pages, and task pages|Actions that appear under the New group. Opens a new [!INCLUDE[navnow](includes/navnow_md.md)] document.|New sales invoice|  
|Promoted Actions|List, card, Role Center pages, and task pages|Provide quick access to common tasks that appear under the Home tab.|Post and print a sales order|  
|Home Items|Role Center pages|Menu items on the Role Center navigation pane.|Customers|  
|Activity Buttons|Role Center pages|Menu buttons for a secondary activity, such as posted documents.|Posted sales invoices|  
  
> [!CAUTION]  
>  If you change an object, for example, an action to an action container, you must also change the ID of the action. The ID serves as a reference, and must reflect the object.  
  
 Each page has a different set of actions depending on the page type, and the processes that the page supports. In order to create the appropriate set of actions for a particular page, you should have a good understanding of your customer's business processes.  
  
 Each process in an organization has several actions associated with it. You should try to create a full set of actions that mirror all tasks and processes that are performed.  
  
 Example: The Sales Orders list page at CRONUS International contains all actions related to processing sales orders. During user configuration and personalization, some of these actions may be hidden or promoted to the ribbon. Therefore, you must create a full set of actions for the customer.  
  
## Types of Actions  
 The following sections describe actions available in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
### Actions  
 The Actions tab is displayed in the ribbon on all page types, and contains relevant tasks for the current page. Some examples from the Customer page are as follows:  
  
-   Sales Invoice  
  
-   Sales Quote  
  
-   Sales Credit Memo  
  
-   Ledger Entries  
  
-   Invoice Discounts  
  
-   Prices  
  
-   Line Discounts  
  
 They are regular daily tasks. Therefore, they must be on the Actions menu, and promoted to the ribbon.  
  
 You can add actions to the Actions menu, group actions together under action submenus, or promote them to the ribbon. You cannot create submenus or promote actions on a Role Center page.  
  
### Navigate  
 The Navigate tab is displayed after Actions in the ribbon. Rather than providing tasks for the user, this tab provides additional information by taking the user to a specific page in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
> [!NOTE]  
>  You should not add a Navigate action to a Role Center page.  
  
### Report  
 The Reports tab is displayed after the Navigate tab on the ribbon. The Reports tab lists the reports most relevant to a page. If a user does not require a Reports tab, then the tab is hidden. Sometimes it is relevant to promote the most important reports to the Home tab to save the user from too many clicks.  
  
### New Document  
 The New action is often displayed both in the Home tab and in the Actions tab. You can use this action to open new documents within [!INCLUDE[navnow](includes/navnow_md.md)]. When you create a New action in Action Designer, you must use the NewDocumentItems SubType.  
  
 Example: On the Customers page, if the order processor wants to create a new invoice, she can open the New page directly from the Actions tab. This is useful as she creates new sales invoices daily.  
  
### Home Items  
 Home Items are actions appear under the Home button, on the Role Center navigation pane. This navigation has a tree structure, and each node in the tree links to a list page.  
  
 The user Role Center is like a home page, and home items in the navigation pane are links to the user’s most useful list pages. For more information, see [Setting Up the Home Button and Home Items](Setting-Up-the-Home-Button-and-Home-Items.md)  
  
### Activity Buttons  
 If there are too many Home items to fit on the Role Center without scrolling, then activity buttons can be used to group other important processes together.  
  
 Example: The Order Processor Role Center could have activity buttons called Approving Web Orders, or Sales Forecasting. These are secondary activities for the order processor, so they do not have to be included under the Home button.  
  
 Each activity button has its own navigation pane, with links to list pages and can be configured just like the user Role Center.  
  
 For more information, see [Creating Activity Buttons for the Navigation Pane](Creating-Activity-Buttons-for-the-Navigation-Pane.md)  
  
## Promoted Actions  
 Promoted actions are actions that are set up on the Actions, Navigate, or Reports tabs in the ribbon, but are also configured to display on the Home tab. Although the actions are set up on the Actions, Navigate, or Reports tabs, you can choose to hide them on these tabs and only show them on the Home tab.  
  
 The Home tab is always displayed first so promoted actions provide quick access to common tasks, because users do not have to browse through a menu to access them. You can promote any command from the existing actions menus to the ribbon. If there are no promoted actions, the ribbon remains hidden.  
  
 Promoted actions can be grouped. For more information, see [How to: Define Promoted Action Categories Captions for the Ribbon](How-to--Define-Promoted-Action-Categories-Captions-for-the-Ribbon.md).  
  
 Each promoted action has an icon associated with it. You can accept a default icon for your promoted action or decide to use a larger icon that makes it more prominent to the user. Use the Properties window in the Action Designer to set the size and location of an icon.  
  
 Example: On the Sales Orders list page, Post is promoted to the ribbon, and included in the Process group. This helps the order processor in her work, because posting sales orders is one of her most important daily tasks.  
  
## Actions at Runtime  
 An action can trigger code to run, such as posting a document or otherwise modifying a record in a table. When a user chooses an action, one of the following pieces of logic will happen in addition to the code that the action itself triggers:  
  
-   If the page is empty and no longer shows any records, the page is re-initialized with default values.  
  
-   If the page does show records, and the current state is within the page filters boundary, the **OnAfterGetRecord** trigger is executed on the page.  
  
-   If the current record that the page showed is now outside the filter but there are other records within the filter, the **OnFindRecord** trigger is called and the **OnAfterGetRecord** trigger is run on the next record with the given filters.  
  
 The logic runs in the transaction that the action triggered. This can cause the application code to result in users locking the whole table when they thought they were only modifying one record.  
  
 To avoid users accidentally locking tables, you can use the **SetSelectionFilter** function before your code passes the record variable to the processing codeunit, for example. The following code example illustrates the code on the **OnAction** trigger on an action on a page.  
  
```  
IF CONFIRM('Are you sure you want to call this codeunit?', TRUE) THEN  
  BEGIN  
  CurrPage.SETSELECTIONFILTER(Rec);  
  CODEUNIT.RUN(50000, Rec);  
  END;  
END;  
  
```  
  
## See Also  
 [Walkthrough: Adding Actions to a Customer List Page](Walkthrough--Adding-Actions-to-a-Customer-List-Page.md)   
 [How to: Add Actions to a Page](How-to--Add-Actions-to-a-Page.md)   
 [How to: Promote Actions on Pages](How-to--Promote-Actions-on-Pages.md)
