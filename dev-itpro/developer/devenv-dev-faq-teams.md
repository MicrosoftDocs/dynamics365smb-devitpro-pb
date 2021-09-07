---
title: "Frequently asked questions about Microsoft Teams integration with Business Central"
description: Answers to typical questions about Teams and Business Central
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# FAQ for Microsoft Teams Integration with Business Central

[!INCLUDE [online_only](includes/online_only.md)]

## What's the technology behind the card in Teams?

The ability to translate a URL into a card is known as link *unfurling* and is one of many extensibility points offered by Teams. When the [!INCLUDE [prod_short](includes/prod_short.md)] link is pasted into message box of a Teams conversation, Teams does the following operations:

1. Matches the domain of the URL to [!INCLUDE [prod_short](includes/prod_short.md)], which is associated with the [!INCLUDE [prod_short](includes/prod_short.md)] app for Teams.
2. Connects to a micro-service that forms part of the [!INCLUDE [prod_short](includes/prod_short.md)] Online services
3. Returns an adaptive card.

Adaptive cards are platform-agnostic way to display compact blocks of information. To learn more, see [Link unfurling](/microsoftteams/platform/messaging-extensions/how-to/link-unfurling?tabs=dotnet) and [Cards](/microsoftteams/platform/task-modules-and-cards/what-are-cards) in the Teams documentation.

## What's the technology behind the card details?

Within the portfolio of extensibility points, Teams offers *task modules*. A task module is a mechanism to display a task-focused window within Teams. Applying the strengths of [!INCLUDE [prod_short](includes/prod_short.md)]'s modern client stack, Teams displays an adaptation of the [!INCLUDE [web_client](includes/webclient.md)] in this window.

To learn more, see [Task Modules](/microsoftteams/platform/task-modules-and-cards/what-are-task-modules) in the Teams documentation.

## What licenses are required for these features to work?

This table gives you an overview of the licenses needed for these features in a Teams conversation.

|What|Teams license|Business Central license|
|----|---|---|
|Send a card|![Teams license check mark](media/check.png "check")|![Business Central license check mark](media/check.png "check")|
|View a card|![Teams license check mark.](media/check.png "Business Central license check mark")||
|View card details|![Teams license check mark](media/check.png "check")|![Business Central license check mark](media/check.png "check")|

## What permissions in [!INCLUDE [prod_short](includes/prod_short.md)] are required for these features to work?

A user who pastes a link into a conversation must have at least read permission to the page and data that is targeted by the link. Otherwise, the link won't expand into card. This requirement is identical to what is required in [!INCLUDE [prod_short](includes/prod_short.md)].

Once a card has been submitted in a conversation, any user in that conversation can view that card without having permission to [!INCLUDE [prod_short](includes/prod_short.md)]. However, to view the card details, users have to have at least read permission to the target page and data. To make changes to data, they'll need modify permissions.

## Does the [!INCLUDE [prod_short](includes/prod_short.md)] app for Teams allow me to create tabs in Teams for displaying Business Central?

No. This scenario isn't supported. The [!INCLUDE [prod_short](includes/prod_short.md)] platform doesn't provide any extensibility or standard features to display a page inside a Teams tab.

## Does the Business Central app for Teams allow me to connect to Teams APIs? 

The [!INCLUDE [prod_short](includes/prod_short.md)] platform doesn't provide any specific ways to call Team APIs from AL code, such as programmatically creating a new team with channels and users. To extend [!INCLUDE [prod_short](includes/prod_short.md)] using Teams APIs, known as “connectors”, see Teams extensibility documentation at [https://developer.microsoft.com/microsoft-teams](https://developer.microsoft.com/microsoft-teams).

## See Also

[Field Groups](devenv-field-groups.md)  
[Designing List Pages](devenv-designing-list-pages.md)  
[Working With Media on Records](devenv-working-with-media-on-records.md)  
