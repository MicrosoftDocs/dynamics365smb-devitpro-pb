---
title: Designing Card Pages
description: "Provides and overview of Role Center design"
author: jswymer
ms.custom: na
ms.date: 01/19/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

[!INCLUDE[newdev_dev_preview](includes/newdev_dev_preview.md)]

# Designing Card and Document Pages

The *card* page type displays selected fields from an underlying table. The *document* page type is very similar except it 

## [Overview](#tab/about)
 
You design card pages when you want to enable user to view, create, and modify records (master and reference data) in a table, such as Customer, Vendor, and Item entities.

Card pages are typically associated with list pages that use the same table as their source. From the list page, users can select a record and open it the card page for viewing and editing.

Fields can be organized into one or more section called FastTabs. In addition, you can add FactBoxes to display additional information about the record in the page.


### Customizing a card pages from the client

In the client, users can personalize card pages by rearranging or hiding content as they like. For more information, see [Personalizing Your Workspace](https://docs.microsoft.com/en-us/dynamics365/business-central/ui-personalization-user). 

As a developer or administrator, you can use Designer to customize a card page the same way that individual users personalize their own work spaces. The difference is that changes you make are applied to all users assigned to the assigned to the same profile. For more information, see [Using Designer](devenv-inclient-designer.md). 

## [Structure](#tab/structure)

### General definition

A card page is defined by page that has the [PageType property](properties/devenv-pagetype-property.md) set to `Card`. The Role Center page is divided into two main areas: navigation/actions area and content area. The following figure illustrates the general layout and elements of a Role Center page.

Mention system actions at top
importance in list part/show more.

### Structure

The following figure illustrates the general layout and elements of a list page.

![Card page overview](media/card-page-overview.png "Card page overview")

The following table describes the elements of a typical list page.


|    |Area|Description|Usage Guidelines|
|----|-------|-----------|----------------|
|1|System actions|The icons provide users the ability to edit the record, create a new record, and delete the current record. These actions appear on all pages; you cannot remove them or add other actions.<br /><br />|These actions appear on all pages; you cannot remove them or add other actions.<br /><br />The actions are only active if the [Editable](properties/devenv-editable-property.md)] is set to `true`.|
|2|Action bar|The action bar provides links to other pages, reports, and codeunits. The action bar is defined by an `actions` control in the page code, and individual actions are defined by an `action()` control.<br /><br /> Actions can be displayed on three standard menus in the action bar, **Actions**, **Navigate**, and **Report**, or in promoted categories, which are like custom menus that you define. You can arrange actions on these menus in the root-level or grouped in a sub-menu.<br /><br /> The objects targeted by these links will open in a separate window.<br /><br />For more information, see [Adding Actions to a Page](devenv-adding-actions-to-a-page.md).|The action bar is designed for running the most important or most often used tasks and operations required by users. Actions will typically target card type pages that enable users to create new entities, such as customers, invoices, and sales orders, or run reports. Place the most important action at the root-level, and group closely related actions in a sub-menu.|
|3|Promoted actions|Promoted actions are actions that are defined in the `area()` control like any other action in code, but they are configured to display on a higher level in the action bar, in a specific category that you define. You promote actions by setting various `Promoted`-related properties on `action()` controls.<br /><br /> For more information, see [Promoted Actions](devenv-promoted-actions.md). |Use promoted actions to provide quick access to the most common tasks that would be performed by the user. Give categories a name that provides a good description of the included actions.|
|5|FastTab|A group of fields under a common heading. A FastTab is defined by a `group()` control in the `area(content)`. You can have multiple FastTabs on the page. In the client, FastTabs appear in the same order as they are defined in the page code.|FastTabs allow users to find key information on a page by displaying the data in separate groups.<br /><br />By default, fields in a FastTab are automatically distributed between two columns. However, you can change how fields are arranged by using the `grid()` and `fixed()`  controls of a FastTab. For more information, see [Field Arrangement on FastTabs](devenv-arranging-fields-on-fasttab.md).  |
|6|Field|A field in the source table, You specify a field by adding a `field()` control. The order of the `field()` controls in code determine the order the dispplay in the client.||
|7|Show more/less|Enables users to show more or show less fields in the FastTab. You specify which fields are shown or hidden in the FastTab by default by setting the `Importance` property on the fields. You can also use the property to display fields in the FastTab header when the FastTab is collapsed.<br /><br /> For more information, see [Importance](properties/devenv-importance-property.md) property.|You use this property to control the amount of information that is visible on a page. It is useful on pages that have a large number of fields, where you can display the most important fields by default, but users have the option to show more as needed.|
|9|Line action|Promoted actions are actions that are defined in the `area`control like any other action in code, but are configured to display on a higher level in the action bar, in a specific category that you define. You promote actions by setting various properties on `action` controls.<br /><br /> For more information, see [Promoted Actions](devenv-promoted-actions.md). |Use promoted actions provide quick access to the most common tasks that would be performed by the user. Give categories a name that provides a good description of the included actions.|
|10|FactBoxes|FactBoxes are located on the right-most side of a page and it is divided into one or more parts that are arranged vertically. Each part can display different content including other pages, charts, and system parts such as Microsoft Outlook, Notes, and Record Links.<br /><br />  For more information, see [Adding a FactBox to a Page](devenv-adding-a-factbox-to-page.md).|Typically, you can use a FactBox to display information that is related to an item on the main content page. For example, on a page that shows a sales order list, you can use a FactBox to show sell-to customer sales history for a selected sales order in the list.|


## [Behavior points](#tab/behavior)

- List pages that are accessed from the Role Center page open embedded within the Role Center framework. The pages are always opened in the read-only mode, regardless of the [Editable](properties/devenv-editable-property.md) property.
- There are a few system actions that are automatically added to the actions bar, such as **Search**, **See Attached** and **Open in Excel**.
- Media and image fields only display in tile view.  

## [Developer tips](#tab/tips)

### General

From the user’s perspective, the following are qualities of a well-designed card page:

-    Use only for data that represents master or reference data
-    The page title clearly identifies the entity/entry represented in the page.
-    Optimize for overview by organizing data in FastTabs and marking relevant fields as Promoted or Additional.
-    Place the most important fields first, in a the first FastTab on the page. 
-    Include one or two FactBoxes to give necessary statistics and quick access to related documents.

### 

## [Designing for devices](#tab/targets)

For the most part, mobile devices will display the same content as the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)], but it is presented in different way to suit how users hold and interact with their mobile device.

You can preview how your page will look on mobile devices directly in Designer.

### Design for the tile view

On mobile devices, records are only displayed as tiles. By default, the first 5 fields defined on the page are used in the tiles. So it is important that you configure a `fieldgroup(Brick; <Field>` control in the table code to display the desired fields. For more information, see [Field Groups](devenv-field-groups.md).

### Promote actions
Only promoted actions will display on mobile devices, so make sure you promote the actions that are most useful to users. For more information, see [Promoted Actions](devenv-promoted-actions.md). 

### Configure actions to display in shortcut menu on rows

Using the [Scope](properties/devenv-scope-property.md) property, configure actions to display in the shortcut menu that is available on each row. You typically do this for common actions that relate to records in the list, such as the **Line Comments** action. This gives users a more direct way to invoke actions that relate to the selected row or line.

### Configure the gesture for actions

Using the [Gesture](properties/devenv-gesture-property.md) property, configure the swipe direction for running actions on a device with a touch interface. For more information, see [Implementation Tips for Gestures](properties/devenv-implementation-tips-gestures-property.md).

## Development tips for overall page design


 
## Design for all display targets
-   Mobile devices will display the same content as the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)], but it is presented in different way to suit how users hold and interact with their mobile device.
-   You can preview how your Role Center will look on mobile devices directly in Designer.
-   Some limitations on mobile devices include the following:
    -   
 
## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Actions Overview](devenv-actions-overview.md)  
[Adding Pages and Reports to Search](devenv-al-menusuite-functionality.md)  
[Personalizing Your Workspace](https://docs.microsoft.com/en-us/dynamics365/business-central/ui-personalization-user)  
[Using Designer](devenv-inclient-designer.md)  