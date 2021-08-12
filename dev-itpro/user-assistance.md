---
title: User assistance model
description: Learn about the user assistance model for Dynamics 365 Business Central and how your solution can comply with it.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 04/01/2021
ms.author: edupont
---

# [!INCLUDE[prod_long](developer/includes/prod_long.md)] User Assistance Model

The [!INCLUDE[prod_short](developer/includes/prod_short.md)] user assistance model is based on the following principles:

- Get started

    Home pages give easy access to key tasks so users can easily get started with work every day. Embedded user assistance implemented as teaching tips help users understand new or unfamiliar pages, and checklists make it easy to get started in a new company.  
- Get unblocked

    Embedded user assistance implemented as tooltips answers most immediate questions about what fields and actions do.
- Learn more

    The Help menu and *Learn more* links on tooltips and teaching tips provide context-sensitive access to Help articles with more information.

Apps, extensions, and customizations are expected to follow the same model by applying tooltips to controls on page objects, and by providing links to Help for their functionality. For more information about customizing and extending the user assistance, see [Extend, Customize, and Collaborate on the Help](help/contributor-guide.md) and [Configure the Help Experience](deployment/configure-help.md).  

In this article, we'll talk about the user assistance model itself and what it does.  

## Help users get started

The user assistance concept of *Get Started* is not just about getting started with [!INCLUDE[prod_short](developer/includes/prod_short.md)] on the first day. It's also about getting started all the other days, and about getting started with infrequent and unfamiliar tasks.  

We strive to make [!INCLUDE [prod_short](includes/prod_short.md)] easy to get started with in the browser and in the apps for desktop and mobile devices. Assistance in the shape of wizards is helpful for setup or filling in data for a complicated report, for example. Home pages that are designed for a particular role or job help users get started with their daily work – they can easily get to their most important tasks, and that means that [!INCLUDE[prod_short](developer/includes/prod_short.md)] helps them get their work done more efficiently. Similarly, in-product links to videos give new users a quick introduction to how the product works.  

### Onboarding checklist

[!INCLUDE [2021_releasewave1](includes/2021_releasewave1.md)]

To help users set up [!INCLUDE [prod_short](includes/prod_short.md)] on the first day, partners can add required steps to the checklist. The checklist is intended to help users fill in necessary information and help themselves get familiar with [!INCLUDE [prod_short](includes/prod_short.md)]. For more information, see [Get Users Started with the Checklist](administration/onboarding-checklist.md).  

### Teaching tips and tours

[!INCLUDE [2021_releasewave1](includes/2021_releasewave1.md)]

[!INCLUDE [ua-teaching-tips](includes/ua-teaching-tips.md)]

> [!NOTE]
> Teaching tips supplement the tooltips that provide descriptions for all fields and actions.  

[!INCLUDE [ua-tooltips-teachingtips](includes/ua-tooltips-teachingtips.md)]

For more information, see [Teaching tips and in-app tours for onboarding users](administration/onboarding-teaching-tips-tours.md).  

## Help users get unblocked

Even the best designed user interface can still be confusing to some. It can be difficult to predict what users will find confusing, and that is why the base application includes descriptions for all controls and actions that can be accessed when you choose the caption of the control or action. In combination with descriptive captions and instructional text, these tooltips, or callouts, constitute the larger part of our current implementation of *embedded user assistance*, which is an important principle in today's world of software design.  

The tooltips help users unblock themselves by providing an answer to the most likely questions the users might have, such as "What data can I input here?" or "What is the data used for?". Keep tooltips in mind when you develop the user interface of your solution.  

:::image type="content" source="media/ua_tooltip_standard.png" alt-text="A standard tooltip for a field on a card page.":::

These descriptions are applied to controls on pages rather than table fields. Table fields can be read-only in one page and editable in another, so the tooltips describe the difference. In [!INCLUDE [prod_short](developer/includes/prod_short.md)], this type of "What is this field?" content is embedded in the page objects, and resource files can be used for translated user interfaces. For more information, see [Working with Translation Files](developer/devenv-work-with-translation-files.md).  

Most tooltips end with an automatically generated link to *learn more* as described in the [Help users learn more](#help-users-learn-more) section; however, tooltips for actions do not have *Learn more* links:

:::image type="content" source="media/ua_tooltip_client.png" alt-text="A tooltip for an action without Learn More link.":::

> [!TIP]
> Users can always use the Ctrl+F1 keyboard shortcut to access the *learn more* content that is configured for the currently-selected item in the user interface.

The tooltips in [!INCLUDE [prod_short](developer/includes/prod_short.md)] are conceptually similar to *[field descriptions](/dynamics365/fin-ops-core/fin-ops/get-started/view-export-field-descriptions?toc=/dynamics365/finance/toc.json)* in Dynamics 365 Finance and related apps, and *[teaching tips](/windows/uwp/design/controls-and-patterns/dialogs-and-flyouts/teaching-tip)* in the Universal Windows Platform's Fluent Design guidelines. The onboarding framework in [2021 release wave 1](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/in-app-contextual-help-improvements) adds another interpretation of teaching tips that you can add to your [!INCLUDE [prod_short](developer/includes/prod_short.md)] solution. For more information, see [Teaching tips and in-app tours for onboarding users](administration/onboarding-teaching-tips-tours.md).

### Guidelines for tooltip text

[!INCLUDE [ua-tooltips](includes/ua-tooltips.md)]

#### Examples

[!INCLUDE [ua-tooltips-examples](includes/ua-tooltips-examples.md)]

## Help users learn more

The content that Microsoft publishes under the user assistance concept of *Learn more* is intended to answer those questions that the user interface (including the tooltips) cannot answer, such as where that page fits into the bigger workflow, or what comes next, or what would be the alternative. Users can access this content either through the *Learn more* link in tooltips, or by using the *Ctrl+F1* keyboard shortcut. For more information, see [Configure Context-Sensitive Help](help/context-sensitive-help.md).  

The base version of [!INCLUDE[prod_short](developer/includes/prod_short.md)] uses content that is published to an online library ([Docs.microsoft.com/dynamics365/business-central](/dynamics365/business-central/index)) so that it can also serve as onboarding material and as feature overviews that you can share with prospects. The content is written in MarkDown, and our source files are available in a [public GitHub repo](https://github.com/MicrosoftDocs/dynamics365smb-docs) that you can extend and customize for your customers.  

There are repos in GitHub for the source content and each of the languages that Microsoft translates to. For more information, see [Extend, Customize, and Collaborate on the Help](help/contributor-guide.md).  

For the base version of [!INCLUDE [prod_short](developer/includes/prod_short.md)], free online learning is also available on Microsoft Learn. For more information, see the [Business Central Learning Catalog](/dynamics365/business-central/readiness/readiness-learning-catalog?toc=/dynamics365/business-central/dev-itpro/toc.json).

### Feedback and contributions

On docs.microsoft.com, each article has two buttons at the end of the article. The *Product feedback* button sends you to the Ideas site, and the *Sign in to give documentation feedback* button lets you submit feedback about the content through GitHub. In both cases, you must create an account if you do not already have one. For *product feedback*, you must sign in with your work or organizational email account. For *access to GitHub*, you can use any email address when you create an account.  

We welcome your contributions, both as pull requests with suggestions or corrections to the content, and as GitHub Issues with bugs or questions. However, we can only accept feedback and contributions to the content in the *dynamics365smb-docs* repo and we cannot address issues or questions about the product.  

> [!IMPORTANT]
> Microsoft only accepts pull requests to the *dynamics365smb-docs* repo, not the language-specific repos. If you have feedback about translations, you can report a GitHub issue in the relevant repo.  

Microsoft also accepts contributions and feedback about the development and administration content through the [dynamics365smb-devitpro-pb](https://github.com/MicrosoftDocs/dynamics365smb-devitpro-pb) repo. This repo does not have translation repos associated with it, but other than that, the same rules apply as for the *dynamics365smb-docs* repo.  

For more information, see [Extend, Customize, and Collaborate on the Help](help/contributor-guide.md).  

### Working in MarkDown

If you fork one of our repos, you will be authoring in MarkDown. We recommend that you learn the basics by referring to the [Docs Markdown reference](/contribute/markdown-reference) section in the Docs Contributor Guide.  

The [Docs Authoring Pack for VS Code](/contribute/how-to-write-docs-auth-pack) can aid with MarkDown authoring and validation in Visual Studio Code. However, you can also use other text editors to edit MarkDown.  

For other tips and tricks, see [Extend, Customize, and Collaborate on the Help](help/contributor-guide.md) and [Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/).  

## Translate the Help

If you want to deliver a [localization app](developer/readiness/readiness-develop-localization.md), or if you want to deliver your functionality in more than one country, you will want to translate the Help as well as the product. We suggest that you take a look at the [Microsoft Dynamics 365 Translation Service](/dynamics365/unified-operations/fin-ops-core/dev-itpro/lifecycle-services/translation-service-overview), which is available as preview in Microsoft Dynamics Life Cycle Services. For more information, see [Translate documentation files](/dynamics365/unified-operations/fin-ops-core/dev-itpro/lifecycle-services/use-translation-service-ua).  

The user interface text, including the tooltips, is translated as part of the application. For more information, see [Working with Translation Files](developer/devenv-work-with-translation-files.md).  

## Style

At Microsoft, we are in process of simplifying and unifying our style guides. To get to know the Microsoft style, use the [Microsoft Writing Style Guide](/style-guide/welcome/) as a good starting point. The [!INCLUDE [prod_short](developer/includes/prod_short.md)] follows most of the guidelines in the Microsoft Writing Style Guide with exceptions for industry terminology and other product-specific issues.  

## Get notified about changes through an RSS feed

[!INCLUDE [ua-rss](includes/ua-rss.md)]

## See Also

[Configure the Help Experience](deployment/configure-help.md)  
[Adding Help Links from Pages, Reports, and XMLports](developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[ToolTip Property](developer/properties/devenv-tooltip-property.md)  
[InstructionalText Property](developer/properties/devenv-instructionaltext-property.md)  
[Development of a Localization Solution](developer/readiness/readiness-develop-localization.md)  
[Translate documentation files](/dynamics365/unified-operations/dev-itpro/lifecycle-services/use-translation-service-ua)  
[Resources for Help and Support](help-and-support.md)  
[Blog post: Extending and customizing the Help](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/extending-and-customizing-the-help-in-dynamics-365-business-central)  
[Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
[Microsoft Cloud Style Guide (requires login)](https://styleguides.azurewebsites.net/StyleGuide/Read?id=2696)  
[Microsoft Writing Style Guide](/style-guide/welcome/)  
[Onboarding experiences in Business Central](administration/onboarding-experiences.md)  
[Teaching tips and in-app tours for onboarding users](administration/onboarding-teaching-tips-tours.md)  
