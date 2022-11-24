---
title: Frequently asked questions about Microsoft Teams integration with Business Central
description: Answers to typical questions about Teams and Business Central
ms.custom: bap-template
ms.date: 11/23/2022
ms.reviewer: na
ms.service: dynamics365-business-central
ms.topic: faq
ms.author: jswymer
author: jswymer
---
# FAQ for Microsoft Teams Integration with Business Central

[!INCLUDE [online_only](includes/online_only.md)]

## What's the technology behind the card in Teams?

The ability to translate a URL into a card is known as link *unfurling*. Unfurling is one of many extensibility points offered by Teams. When the [!INCLUDE [prod_short](includes/prod_short.md)] link is pasted into message box of a Teams conversation, Teams does the following operations:

1. Matches the domain of the URL to [!INCLUDE [prod_short](includes/prod_short.md)], which is associated with the [!INCLUDE [prod_short](includes/prod_short.md)] app for Teams.
2. Connects to a micro-service that forms part of the [!INCLUDE [prod_short](includes/prod_short.md)] Online services
3. Returns an adaptive card.

Adaptive cards are platform-agnostic way to display compact blocks of information. To learn more, see [Link unfurling](/microsoftteams/platform/messaging-extensions/how-to/link-unfurling?tabs=dotnet) and [Cards](/microsoftteams/platform/task-modules-and-cards/what-are-cards) in the Teams documentation.

## What's the technology behind the card details?

Within the portfolio of extensibility points, Teams offers the *Stage View*. The Stage View module is a mechanism to display a large window and canvas within Teams.

Applying the strengths of [!INCLUDE [prod_short](includes/prod_short.md)]'s modern client stack, Teams displays an adaptation of the [!INCLUDE [web_client](includes/webclient.md)] in this window.

For more information, go to [Tabs link unfurling and Stage View](/microsoftteams/platform/tabs/tabs-link-unfurling) in the Teams documentation.

## What licenses are required for these features to work?

This table gives you an overview of the licenses needed for these features in Teams.

|What|Teams license|Business Central license|
|----|---|---|
|Send a card|![Teams license check mark](media/check.png "check")|![Business Central license check mark](media/check.png "check")|
|View a card|![Teams license check mark.](media/check.png "Business Central license check mark")||
|View card details|![Teams license check mark](media/check.png "check")|![Business Central license check mark](media/check.png "check")*|
|Add a tab|![Teams license check mark](media/check.png "check")|![Business Central license check mark](media/check.png "check")|
|View a tab|![Teams license check mark](media/check.png "check")|![Business Central license check mark](media/check.png "check")*|

* If the environment allows access with Microsoft 365 license, a Business Central license isn't required for these features.

## What permissions in [!INCLUDE [prod_short](includes/prod_short.md)] are required for these features to work?

Business Central features in Teams are protected by Business Central's security stack configured by developers and administrators:

- A user who pastes a link into a conversation must have at least read permission to the page and data that is targeted by the link. Otherwise, the link won't expand into card. This requirement is identical to what is required in [!INCLUDE [prod_short](includes/prod_short.md)].
- Once a card has been submitted in a conversation, any user in that conversation can view that card without having permission to [!INCLUDE [prod_short](includes/prod_short.md)]. However, to view the card details, users have to have at least read permission to the target page and data. To make changes to data, they'll need modify permissions.
- A user can only add a tab containing objects they have permission to.
- Once a tab has been added, any user in that chat or channel must have at least read permission to the target page and data. To make changes to data, they’ll need modify permissions. 

## Does the Business Central app for Teams allow me to connect to Teams APIs?

The [!INCLUDE [prod_short](includes/prod_short.md)] platform doesn't provide any specific ways to call Team APIs from AL code. For example, you can't programmatically create a new team with channels and users. To extend [!INCLUDE [prod_short](includes/prod_short.md)] using Teams APIs, known as *connectors*, see Teams extensibility documentation at [https://developer.microsoft.com/microsoft-teams](https://developer.microsoft.com/microsoft-teams).

## Can I display custom pages in tabs? 

Yes. Business Central doesn't restrict which object ranges you can display in a tab. However, the user accessing the tab must have a license and permissions to that object.

## Can I display Role Center pages in a tab? 

Role Center pages aren't supported in tabs and card details windows. To display business insights, charts, and KPIs, try building Power BI reports that can be displayed and accessed in Teams. Learn about adding the Power BI app to Teams at [Embed Power BI content in Microsoft Teams](/power-bi/collaborate-share/service-embed-report-microsoft-teams).

## See Also

[Field Groups](devenv-field-groups.md)  
[Designing List Pages](devenv-designing-list-pages.md)  
[Working With Media on Records](devenv-working-with-media-on-records.md)  
