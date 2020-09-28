---
title: "Pages Overview"
description: "Pages are the main way to display and organize data." 
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Pages Overview

In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], pages are the main way to display and organize data. Pages are the primary object that a user will interact with and have a different behavior based on the type of page that you choose. Pages are designed independently of the device they are to be rendered on, and in this way the same page can be reused across phone, tablet, and web clients.

A page is defined in code as an object composed of controls, properties, actions, and triggers. You can also use Designer in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] to create a page. For more information, see [Using Designer](devenv-inclient-designer.md). 

Whether you are creating a new page, or extending an existing page, you will add a new .al file to your project and describe the [page object](devenv-page-object.md) in code. The difference is basically that for a new page, you need to define the entire page, whereas when modifying an existing page, you only add the extra functionality or modify the existing. 

The structure of a page is hierarchical and breaks down in to three sections. The first block contains metadata for the overall page. The metadata describes the page type and the source table it is showing data from. The next section; the layout, describes the visual parts on the page. The final section details the actions that are published on the page.

Furthermore, the page has properties. Properties work in the same way for pages as they do for other [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] objects. For more information, see [Page Properties](properties/devenv-page-property-overview.md). 

> [!TIP]  
> For information about designing pages, see [Page Types and Layouts](devenv-page-types-and-layouts.md).

## Page metadata

For a new page object, you must at least specify the type of page; `PageType` and the data source; `SourceTable` of the page. And you can also set other metadata at the beginning of the declaration of the page object.  

```
page 50102 PageName
{
    PageType = List;
    SourceTable = TableName;
    Editable = true;
    ContextSensitiveHelpPage = 'feature-overview';
    ...
}
```

### Types of pages  

Which page type you choose depends on the application task that you want to support, the content that you want to display, and how you want to display it. The Role Center page is the main or home page and it helps the user focus on the most important daily tasks and activities. Other types of pages, such as list pages or card pages are typically linked from the home page for easy access. The following page types are available:  

|Page type   |Description|
|------------|-----------|
|`RoleCenter`|The Role Center page is the main page.|
|`Card`|A Card page is used to view and edit one record or entity from a table.|
|`CardPart`|A Card Part page is used in a FactBox on another page to view or edit additional fields associated with a selected entity in the page.|
|`List`|A List page displays content from a table in a list format.|
|`ListPart`|Similar to a List page, a List Part page displays content from a table in a list format. The difference is that you use the List part page as another page in a FactBox or as a part of the Role Center page.|
|`ListPlus`|A ListPlus page displays content from a table in a list format. The difference from a List page is that the main content is a ListPart, not a Repeater group as the List has it.|
|`Document`|A Document page usually consists of two separate pages combined into one, with one page nested in the other. A Document page is suitable for use when you want to display data from two tables that are linked together.|
|`WorkSheet`|You use a Worksheet page type for creating worksheet or journal task pages.|
|`ConfirmationDialog`|You use the ConfirmationDialog page to display messages or prompt users with a confirmation before they continue with the task that they are working on.|
|`StandardDialog`|The StandardDialog is a simple page type that you use when users only need to input data and do not need to perform other actions from the page.|
|`NavigatePage`|You use a Navigate page type to create a wizard that leads the user through a sequence of steps for completing a task.|
|`HeadlinePart`|You use a HeadlinePart page type to display a set of changing headlines on a Role Center. For more information, see [Creating a Role Center Headline](devenv-create-role-center-headline.md)|
|`API`|Pages of this type are used to generate web service endpoints and cannot be shown in the user interface. This page type should not be extended by creating a page extension object. Instead, create a new API by adding a page object.|

> [!NOTE]  
> For backwards compatibility we continue to support adding non-part pages as parts. We do, however, recommend that you redesign your page to only use Card part or List part, as we may remove support in a future update. 

## Page layout

The page layout of the page object determines what the page will look like and is specified in the `layout` section. The `layout` contains one or more `area` sections that define a certain placement on the page. 

You can choose between the following `area` categories:

|Area type|Placement on the page|
|---------|---------------------|
|`Content`|The content area displays the content of, for example, a RoleCenter or a List page.|
|`FactBoxes`|The FactBox area is placed to the right-most side of a page. <br> Displays content related to an item on the main content page. </br>|
|`RoleCenter`|The RoleCenter is the main page of the application and is used for quick access to frequently used information and tasks.|
  
### Page actions

All pages contain menu items and navigation controls called actions. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], actions are displayed at the top of each page in the ribbon or in the navigation pane. The `actions` section of the page describes what the user is able to do on a page and must be designed with the user's need for process support in mind. 

Actions can be displayed in the ribbon of all pages and grouped together under the following actions tabs: 

- Home
- Actions  
- Navigate
- Report

Creating actions can include adding activity buttons/cues to a page, configuring navigation items on a user role center, or adding Reports to a page. To learn how you can enable users to quickly locate the actions they want to use, see [Actions](devenv-actions-overview.md). 

## Adding Help to the page objects

The [!INCLUDE [prodshort](includes/prodshort.md)] user assistance model expects your solution to include tooltips and links to context-sensitive Help. For more information, see [User Assistance Model](../user-assistance.md).  

### Context-sensitive Help

To apply context-sensitive Help to your app, you specify a URL to your Help library in the app.json file, and you then set the relevant target Help files as property values for each of your page objects and page extension objects. Between them, these two settings then give users access to context-sensitive Help for the features in your app at runtime. For more information, see [Configure Context-Sensitive Help](../help/context-sensitive-help.md).  

### Tooltips

In combination with descriptive captions and instructional text, tooltips are our current implementation of *embedded user assistance*, which is an important principle in today’s world of software design. The tooltips are there to help users unblock themselves by providing an answer to the most likely questions the users might have, such as “What data can I input here?” or “What is the data used for?”.  

The base application has set the Tooltip property for all controls on (almost) all page objects. Most system actions also include tooltips so that users get a consistent experience. Your extensions are expected to also include tooltips for the same reason. For more information, see [ToolTip Property](../developer/properties/devenv-tooltip-property.md).  

### Instructional text

The base application has applied instructional text to setup guides and certain other types of page objects. Your extensions are expected to also include instructional text to setup guides for the same reason. For more information, see [InstructionalText Property](../developer/properties/devenv-instructionaltext-property.md).  

### Example

The following example shows how you can apply user assistance and link to Help in a page object:

```
page 50101 "Reward Card"
{
    PageType = Card;
    SourceTable = Reward;
    ContextSensitiveHelpPage = 'sales-rewards';

    layout
    {
        area(content)
        {
            group(Reward)
            {
                InstructionalText = 'Fill in the fields so that you can reward customers with discounts.';
                field("Reward Id"; "Reward ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID of the reward.';
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies what this type of reward is used for.';
                }

                field("Discount Percentage"; "Discount Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the impact of the reward on the customer''s price.';
                }
            }
        }
    }
}
```

In this example, the app.json file has specified a link to where the *sales-rewards* target file is published, such as `"contextSensitiveHelpUrl": "https://mysite.com/documentation"`.

## Best practices for designing pages

We recommend that you simplify the user experience by reducing what users see by default. You can promote the information that the users most frequently need to see and hide the less important information. For example:  
  
- Place common tasks in the ribbon  
  
- Organize information pages under FastTabs and, by default, hide the FastTabs that are infrequently visited.  
  
- Use one to three FactBoxes on a page to provide supplementary information and a place for adding notes  

- Add a target Help file for context-sensitive Help for the feature that the page object supports

## See Also

[Page, Page Fields, and Page Extension Properties](properties/devenv-page-property-overview.md)  
[Actions Overview](devenv-actions-overview.md)  
[Using Designer](devenv-inclient-designer.md)  
[Page Types and Layouts](devenv-page-types-and-layouts.md)   
[Adding a Factbox to a Page](devenv-adding-a-factbox-to-page.md)  
[Designing Role Centers](devenv-designing-role-centers.md)  
[Configure Context-Sensitive Help](../help/context-sensitive-help.md)  
