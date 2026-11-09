---
title: Designing List Pages for Business Central
description: Learn how to design Business Central list pages with clear layouts, useful actions, filters, tile views, and device-specific behavior.
author: jswymer
ms.date: 11/05/2026
ms.topic: concept-article
ms.author: jswymer
ms.reviewer: jswymer
---

# Designing list pages

The *List* page type displays records from an underlying table, either as rows and columns or as individual tiles.

## [Overview](#tab/about)

You design list pages when you want to provide users with a collection of data, enabling them to get an overview of and find entities to work with, such as customers, vendors, or sales orders. Typically, a list page will link to an associated card page that lets users view or modify specific entities in the list.

There are different ways to make a list page available in the application:

- Make the list page available from the navigation of a role center page.

    This option gives users quick access to the page. The list opens in the content area of the role center, with the navigation area still available at the top. Learn more in [Designing role centers](devenv-designing-role-centers.md).
- Make the list page available from an action on another page.

    The list page opens over the current page rather than embedded in the role center.
- Make the list page searchable from **Tell Me**.

    The list page also opens over the current page. Learn more in [Adding pages and reports to search](devenv-al-menusuite-functionality.md).

### Customizing list pages from the client

Users can personalize list pages by rearranging or hiding columns, actions, and FactBoxes. Learn more in [Personalizing your workspace](/dynamics365/business-central/ui-personalization-user).

As a developer or administrator, you can use Designer in a Business Central online sandbox to customize list pages. Package the changes in an extension to deploy them for other users. Learn more in [Use Designer](devenv-inclient-designer.md).

## [Structure](#tab/structure)

### General definition

A list page is defined by a page that has the [PageType property](properties/devenv-pagetype-property.md) set to `List` and [SourceTable property](properties/devenv-sourcetable-property.md) set to the table object that contains the records that you want to display.

To associate a list page with a card page, which enables users to view, edit, or create records, set the [CardPageId property](properties/devenv-cardpageid-property.md) on the list page.

For a code example, see [Simple list page example](devenv-simple-list-page-example.md).

### Structure

The following illustration identifies the main areas of a list page. Action placement can differ by version and configuration.

:::image type="content" source="media/list-page-overview-v3.png" alt-text="Annotated Business Central list page showing list and tile views, actions, FactBoxes, search, and the filter pane." lightbox="media/list-page-overview-v3.png":::

The following table describes the elements of a typical list page.


|  No.  |Area|Description|Usage guidelines|
|----|-------|-----------|----------------|
|1|List|Displays records of the source table as rows and columns. Each row is a record, and the columns are fields. Define the list by adding a `repeater()` control within `area(Content)`, then add `field()` controls for the fields to display. Learn more in [Work with repeater controls](devenv-repeater-controls.md).|The order of the `field` controls determines their initial order on the page.|
|2|Tile view|Displays records as tiles, also called bricks. Users can switch between list and tile views where available.<br /><br /> Define a `fieldgroup(Brick; <Field>)` in the source table to control which fields appear in tiles. A `Brick` field group isn't required for the client to display tiles.<br /><br /> Learn more in [Displaying data as tiles](devenv-lists-as-tiles.md).|Tiles are useful for records with media or images, such as customers, contacts, and items. Learn more in [Working with media on records](devenv-working-with-media-on-records.md).|
|3|Action bar|Provides actions that open pages, run reports, or execute codeunits. Define the action bar in the `actions` section and individual actions with `action()` controls.<br /><br /> Actions can appear on menus such as **Actions**, **Navigate**, and **Report**, or in promoted categories. Arrange actions at the menu's top level or in groups. Pages opened from actions appear over the current page.<br /><br /> Learn more in [Adding actions to a page](devenv-adding-actions-to-a-page.md).|Include actions that users need for the task, such as posting, running a report, or opening related information. Place important actions at the top level and group closely related actions in submenus.|
|4|Promoted actions|Promoted actions give selected actions a prominent place in the action bar. Define action references with `actionref` in `area(Promoted)`. Existing pages can also use the legacy `Promoted`-related properties on `action()` controls.<br /><br /> Learn more in [Promoted actions](devenv-promoted-actions.md).|Promote the actions that users need most often. Other actions remain available through the action bar's menus. Older action bar layouts use **More options** to show actions that aren't promoted.|
|5|FactBoxes|The FactBox pane on the right side of a page contains vertically arranged parts. Each part can display content such as other pages, charts, or system parts.<br /><br /> Learn more about supported system parts, including Notes and Links, in [Adding a FactBox to a page](devenv-adding-a-factbox-to-page.md#system-parts).|Use a FactBox for information related to the current record. For example, show sell-to customer sales history for the selected sales order.|
|6|Search|A cross-column text search helps users narrow the records in a list. Standard list pages provide **Search** without additional code.<br /><br /> Learn more in [Searching, filtering, and sorting data](/dynamics365/business-central/ui-enter-criteria-filters).||
|7|Filter pane|Users can filter one or more fields to limit the records displayed. They can show or hide the filter pane as needed. Learn more in [Searching, filtering, and sorting data](/dynamics365/business-central/ui-enter-criteria-filters).|The client provides the filter pane without extra code. You can define special words called filter tokens that users enter to filter records. Learn more in [Adding filter tokens](devenv-adding-filter-tokens.md).<br /><br /> FlowFilters let users adjust dimensions that influence calculated fields. They appear in the **Filter totals by** section. Learn more in [FlowFilters](devenv-flowfilter-overview.md).|

> [!IMPORTANT]
> Use a single [repeater control](devenv-repeater-controls.md) in the content area of a list page. If you include multiple repeaters or other controls, such as a [group or grid](devenv-arrange-fields-in-rows-and-columns-using-gridlayout-control.md), the page might not behave as expected. For pages that need other content controls, consider [Worksheet page layouts](devenv-page-types-and-layouts.md#worksheet-page-layouts).

## [Behavior points](#tab/behavior)

- The [Editable property](properties/devenv-editable-property.md) permits editing on a list page. Availability of **Edit List** also depends on `ModifyAllowed`, user permissions, and how the page is opened. Users can select **Edit List** to edit values across rows when editing is available.
- List pages that you access from the role center page open embedded within the role center framework. The pages always open in the read-only mode, regardless of the [Editable](properties/devenv-editable-property.md) property.
- List pages include system-provided actions, such as **Show Attached** and **Open in Excel**. The available actions depend on the page, client capabilities, and user permissions.
- Analysis mode is enabled by default on eligible list pages for users with the required permission. This setting doesn't mean pages open in analysis mode. To disable the ability, set the [AnalysisModeEnabled property](properties/devenv-analysismodeenabled-property.md) to `false`.
- In Business Central online, **Edit in Excel** is available by default on eligible list pages for users with the required permissions. It isn't available for pages bound to temporary tables. On-premises environments require additional setup. Learn more in [Controlling Edit in Excel on list pages](devenv-edit-in-excel-lists.md).
- Tile views are useful for emphasizing record images and media. Images and media thumbnails aren't limited to tile view.

## [Developer tips](#tab/tips)

From the user's perspective, a well-designed list page:

- Displays a single collection of entities or entries that the user needs for their work.
- Has a title that identifies the collection and the current view.
- Places important columns first and sets the [FreezeColumn property](properties/devenv-freezecolumn-property.md) on the repeater control to identify the last frozen column. That column and all preceding columns remain visible when users scroll horizontally.
- Is accessible from relevant actions on the role center.
- Includes one or two FactBoxes to give necessary statistics and quick access to related documents.
- Promotes the actions that users need most often.

> [!IMPORTANT]
> Use a single [repeater control](devenv-repeater-controls.md) in the content area of a list page. If you include multiple repeaters or other controls, such as a [group or grid](devenv-arrange-fields-in-rows-and-columns-using-gridlayout-control.md), the page might not behave as expected. For pages that need other content controls, consider [Worksheet page layouts](devenv-page-types-and-layouts.md#worksheet-page-layouts).


## [Designing for devices](#tab/targets)

Mobile devices generally display the same content as the web client. The layout adapts to the device and how users interact with it.

You can preview how your page will look on mobile devices directly in Designer.

### Prioritize the visible columns

Design list pages to avoid having important columns on the far right of the column list. Assume you have no control over how many columns are displayed and consider that only the first few columns will be made visible.

### Design for tile views

On phones, lists use tiles. Tablet layouts can also display rows and columns. Define a `fieldgroup(Brick; <Field>)` in the source table to choose which fields appear in tiles. Without a `Brick` field group, the client can use the `DropDown` field group or fall back to the first five columns. Learn more in [Field groups](devenv-field-groups.md).

### Promote frequently used actions

Only promoted actions display on mobile devices, so promote the actions that are most useful to users. Learn more in [Promoted actions](devenv-promoted-actions.md).

### Configure actions to display in shortcut menu on rows

Use the [Scope property](properties/devenv-scope-action-property.md) to configure actions in the shortcut menu on each row. This property is useful for actions related to a record, such as **Line Comments**.

### Configure the gesture for actions

Use the [Gesture property](properties/devenv-gesture-property.md) to configure the swipe direction for running actions on a device with a touch interface.

---

## Related information

[AL development environment](devenv-reference-overview.md)  
[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page extension object](devenv-page-ext-object.md)  
[Actions overview](devenv-actions-overview.md)  
[Adding pages and reports to search](devenv-al-menusuite-functionality.md)  
[Personalizing your workspace](/dynamics365/business-central/ui-personalization-user)  
[Use Designer](devenv-inclient-designer.md)  
