---
title: "Action Bar Guidelines"
description: "Guidelines for organizing actions in the action bar for Dynamics 365 Business Central"
author: jacobwj
ms.custom: na
ms.date: 11/03/2022
ms.reviewer: 
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Action Bar Guidelines

This article provides guidelines for organizing actions when creating, extending, and customizing pages in [!INCLUDE [prod_short](includes/prod_short.md)]. The guidelines follow the principles and precedence of Microsoft 365 applications, such as Outlook, with the primary goal of providing a familiar and efficient command presentation to the [!INCLUDE [prod_short](includes/prod_short.md)] users. 

## Pages and actions

Pages make up the user interface in [!INCLUDE [prod_short](includes/prod_short.md)] and frame the activities and tasks that users have, supported by the actions defined in the pages. Almost all pages present a combination of system actions, which are the common actions that are found on many pages, such as **Edit**, **View**, and **Delete**, and application actions, which are unique actions defined and developed for each page, such as **Post** on document pages. 

With the desktop user interface to [!INCLUDE [prod_short](includes/prod_short.md)], actions are available to the user in several places on a page. An action's placement reflects its scope and importance among the total set of actions. Most important are the actions in the action bar appearing prominently at the top of a page, close to the page title. Here, the action bar combines system actions, application actions, and the various toggles for panes and panels, such as the Factbox pane, to form the command presentation for the page level. 

<illustration> 

## Page level actions

Page level actions are the actions in a page whose scope and effect the user understands in relation to what the whole page stands for. For example, with a document page that is a sales invoice, the scope of the Post action is the whole document, making that a page level action. A page level action may allow or expect the user to make a selection in the page that sets or limits the scope of the action, such as when the Post action in a list assumes the user has selected an invoice to Post. 

## Part level actions 

In addition to actions at the page level, each part on a page may have specific actions available to the user for managing and working with that part. For example, the **Lines** section on a document has both system and application actions whose scope the user understands to be exclusively the document lines and which appears to the user within the Lines section. Similarly, Factboxes can define actions specific to their functionality that the user reaches in an action menu on the Factbox. 

<illustration> 

## Application actions 

Achieving a great user experience starts with organizing the page level actions to suit users’ needs and expectations. Consider the tasks that users have with the page, the type of page you place actions in, and the total set of actions in the page. In the following, we describe these considerations in more detail. 

## See also