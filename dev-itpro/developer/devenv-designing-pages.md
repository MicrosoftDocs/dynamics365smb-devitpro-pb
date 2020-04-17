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
ms.author: solsen
---

# Designing Pages

Understanding how [!INCLUDE[prodshort](includes/prodshort.md)] displays a page dependent on its page type is important to be able to create a good user experience. There are also several page properties and variations of the page structures that can help create an intuitive and efficient user interface.

## Understanding page types 

Choosing the right page type is the first step when creating or modifying a page. The next step is to organize the page contents to suit its purpose in your solution. We recommend that you design pages based on the user tasks that you want to support. 

The following table provides an overview of the page types supported in [!INCLUDE[prodshort](includes/prodshort.md)], their typical uses, and basic characteristics. 

<!-- page types table -->

## The two principal page types 

A fundamental characteristic of the available page types lies in the way that a page type relates to the data presented on the page. Two principal ways exists: entity-orientation (typical for the Card page type) and collection-orientation (typical for the List page type.) 

The entity-oriented page types (Card, Document, and ListPlus) provide the user with actions to toggle edit/view mode, creating new, and deleting records, at the top of the page. The collection-oriented page types (List and Worksheet) provide all actions in the page action bar. 

[illustration of header of entity page and header of collection page] 

## Entity-oriented pages 

In [!INCLUDE[prodshort](includes/prodshort.md)], entity-oriented pages are used to support users when their tasks revolve around a single business entity. The most typical entity-oriented task page is the card, which provides details about a single customer or other master data, and the document, which represents a single transaction or other important business event. 

ListPlus is also an entity-oriented page type. Unlike Card and Document pages, the ListPlus page type is for pages that have a prominent listpart and either few or no header fields.  

Entity-oriented page characteristics 

The overall characteristics of an entity-oriented page are: 

The page title identifies the specific entity represented in the page. For example, a customer card will have the customer number or name as the page title. 

Page commands act in relation to the entity shown in the page. For example, if you choose Delete on a customer card page, the system will delete that customer. 

FactBoxes that show related details (statistics, links, notes) about the specific entity represented in the page, in textual or chart form. 

Important: Since entity-oriented pages always represent a single domain entity, such as a customer or an item, we recommend that you do not use Repeater groups in the construction of entity-oriented pages. Use Repeater groups only when you construct collection-oriented pages. Note that Repeater groups may be used in pages that are in turn included as individual List parts in an entity-oriented task page. 

 


## See Also