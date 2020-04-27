---
title: "Designing Pages"
description: Pages are the main way to display and organize data. 
author: 
ms.custom: na
ms.date: 04/17/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Designing Pages

Understanding how [!INCLUDE[prodshort](includes/prodshort.md)] displays a page dependent on its *page type* is important to be able to create a good user experience. There are also several page properties and variations of the page structures that can help create an intuitive and efficient user interface.

## Understanding page types 

Choosing the right page type is the first step when creating or modifying a page. The next step is to organize the page contents to suit its purpose in your solution. We recommend that you design pages based on the user tasks that you want to support. 

The following table provides an overview of the page types supported in [!INCLUDE[prodshort](includes/prodshort.md)], their typical uses, and basic characteristics. 

|Page type|Examples of use|Main data display|Characteristics|
|---------|---------------|----------------|---------------|
|`RoleCenter`|Overview of business performance and what to attend to for a specific user profile|Defined by included parts.|A collection of parts (Cues, KPIs, etc.) and the contents of the navigation pane.|
|`Card`|Master, reference, and set up data management.|Single entity|Titled entity with FastTabs. May include parts.|
|`Document`|Transaction and other document management.|Single entity|Titled entity with FastTabs. Should have the document lines ListPart as the second section.|
|`ListPlus`|Statistics, details, and related data management.|Single entity|Titled entity with FastTabs. Usually includes at least one `ListPart`.|
|`List`|Entity overviews and navigation, and inline editing of simple entities.|Collection of entities/entries|A single list with a caption. May have field groups and subpages below the list’s `Repeater`.|
|`Worksheet`|Line-based data entry tasks (such as journals) and inquiries.|Collection of entities|A single list or table with caption. May include field groups and subpages above or below the worksheet’s `Repeater`.|
|`StandardDialog`|Routine dialog that starts or progresses a task.|Single or collection|A cancelable dialog with an instruction to the user. May have FastTabs with fields or a single list.|
|`ConfirmationDialog`|Confirmative or exceptional dialog, such as warnings.|Single or collection|A Yes/No dialog with an instruction to the user. May have FastTabs with fields or a single list.|
|`CardPart`|A page that is included in another page, e.g. a FactBox.|Single entity|Single group of fields representing fields in a FastTab.|
|`ListPart`|A page that is included in another page, e.g. a FactBox.|Collection of entities/entries|Single `Repeater` representing columns in a list or table.|
|`NavigatePage`|Multi-page dialogs (also known as a "Wizard").|Single or collection|One or more groups of fields.|


## The two principal page types 

A fundamental characteristic of the available page types lies in the way that a page type relates to the data presented on the page. Two principal ways exists: entity-orientation (typical for the Card page type) and collection-orientation (typical for the List page type.) 

The entity-oriented page types (Card, Document, and ListPlus) provide the user with actions to toggle edit/view mode, creating new, and deleting records, at the top of the page. The collection-oriented page types (List and Worksheet) provide all actions in the page action bar. 

<!-- illustration of header of entity page and header of collection page -->

## Entity-oriented pages 

In [!INCLUDE[prodshort](includes/prodshort.md)], entity-oriented pages are used to support users when their tasks revolve around a single business entity. The most typical entity-oriented task page is the card, which provides details about a single customer or other master data, and the document, which represents a single transaction or other important business event. 

ListPlus is also an entity-oriented page type. Unlike Card and Document pages, the ListPlus page type is for pages that have a prominent listpart and either few or no header fields.  

### Entity-oriented page characteristics 

The overall characteristics of an entity-oriented page are: 

- The page title identifies the specific entity represented in the page. For example, a customer card will have the customer number or name as the page title. 

- Page commands act in relation to the entity shown in the page. For example, if you choose Delete on a customer card page, the system will delete that customer. 

- FactBoxes that show related details (statistics, links, notes) about the specific entity represented in the page, in textual or chart form. 

> [!IMPORTANT]  
> Since entity-oriented pages always represent a single domain entity, such as a customer or an item, we recommend that you do not use Repeater groups in the construction of entity-oriented pages. Use Repeater groups only when you construct collection-oriented pages. Note that Repeater groups may be used in pages that are in turn included as individual List parts in an entity-oriented task page. 

## Collection-oriented pages 

In [!INCLUDE[prodshort](includes/prodshort.md)], collection-oriented pages are used to support users when their tasks involve multiple entities or records at the same time. The most typical collection-oriented page is the list (showing customers, items, etc.) from which the user can seek out the entities to work with. 

### Collection-oriented page characteristics 

The overall characteristics of a collection-oriented page include: 

- A prominent list or table of entities, records, or entries. 

- A page title, or alternatively fields above the table/list, which describe or identify the collection of data shown in the page. For example, the Customer List provides an overview of the customer entities from which the user can then open individual customer card pages. 

- Commands that act in relation to the selected row or rows in the list or table. For example, selecting a customer in the Customer list, and then choosing Delete, will delete only the selected customer, not all customers in the list. 

- FactBoxes that show related details (statistics, links, notes) about the selected row in the table or list, in textual or chart form. 

- A Details pane below the list or table can optionally show details (additional fields) about the selected row, in textual or chart form. 

## Composing pages 

Within a page, the developer can combine page fields into groups. This can help the user overview the page by placing related fields together. And within a group, subgroups can further increase the structure of the data displayed in a page. 

Besides adding fields and groups to a page, it is possible to include another page of type CardPart or ListPart. (These two page types can in turn not include other pages.) 

When pages are created to include CardParts and ListParts, Business Central will take care of sharing the available screen real estate between the page’s groups of fields and any included pages. Screen space is divided between field groups and included pages such that the user can get access to the full contents of the page, and collapse/expand specific sections of interest. 

How space allocation takes place for a given page depends on the chosen page type, the structure of page contents (field groups and page parts), and—of course—on the size of the browser window. 

### Field groups and page parts 

<!-- show legend for displaying groups and page parts. -->

### Card and Document page layouts 

<!-- Snippet about what Card and Doc pages are for. -->

Example 1. Field groups are placed vertically from top to bottom of the page 

Example 2. A ListPart can be included. In this case, the listpart’s height is limited to show 5 rows.  

Example 3. When a listpart is included as the last part on the page, it will expand to fill space. 

 

### ListPlus page layouts 

<!-- Snippet about what ListPlus pages are for. -->

Example 1. Field sections are placed from top to bottom. The first ListPart fills vertical space. 

Example 2. When placing two (or more) ListParts, they will share available vertical space. 

Example 3. When placing two ListParts in a group, they share horizontal and vertical space. 

 

### List page layouts 

<!-- Snippet about what List pages are for. -->

Example 1. The repeater group assumes full vertical space. 

Example 2. When a field group or cardpart is included, space for repeater is reduced. 

Example 3. When a listpart is included, space is shared equally between part and repeater. 



### Worksheet page layouts 

<!-- Snippet about what worksheet pages are for. -->

Example 1. The repeater group assumes full vertical space, leaving space for groups above and below. 

Example 2. If a listpart is included, vertical space is shared with repeater group. 

Example 3. When a listpart is included, space is shared equally between part and repeater. 


### Dialog page layouts 

<!-- Snippet about what dialog pages are for. -->

Example 1. The repeater group assumes full vertical space, leaving space for groups above and below. 

Example 2. If a listpart is included, vertical space is shared with repeater group. 

Example 3. When a listpart is included, space is shared equally between part and repeater. 

[illustration of dialog and modal pages] 

 
## See Also
