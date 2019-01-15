---
title: User assistance model
description: Learn about the user assistance model for Dynamics 365 Business Central and how your solution can comply with it.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 01/15/2019
ms.author: edupont
---

# [!INCLUDE[prodlong](developer/includes/prodlong.md)] User Assistance Model

The [!INCLUDE[prodshort](developer/includes/prodshort.md)] user assistance model is based on the following principles:

- Get started

    Default values and setup wizards makes it easy to start using [!INCLUDE[prodshort](developer/includes/prodshort.md)] with your own data, in-product videos give new users a quick introduction to how the product works, and Home pages give easy access to key tasks so each user can easily get started with their work every day.
- Get unblocked

    Embedded user assistance implemented as tooltips answers most immediate questions about what fields and actions do.
- Learn more

    The Help menu and the tooltips provide context-sensitive links to Help articles with more information.

Apps, extensions, and customizations are expected to follow the same model by applying tooltips to controls on page objects, and by providing links to Help for their functionality. For more information about customizing and extending the user assistance, see [Configure the Help Experience](deployment/configure-help.md).  

In this article, we'll talk about the user assistance model itself and what it does.  

## Help users get started

The user assistance concept of *Get Started* is not just about getting started with [!INCLUDE[prodshort](developer/includes/prodshort.md)] on the first day. It’s also about getting started all the other days, and about getting started with infrequent and unfamiliar tasks.  

Assistance in the shape of wizards is very helpful for setting things up, or filling in data for a complicated report, for example. Designing Home pages that are truly designed for that particular role or job is also very useful in helping users get started with their work every day – they can easily get to their most important tasks, and that means that [!INCLUDE[prodshort](developer/includes/prodshort.md)] helps them get their work done more efficiently.  

<!-- TODO: Reference to UX guidelines -->

## Help users get unblocked

Even the best designed user interface can still be confusing to some. It can be difficult to predict what users will find confusing, and that is why the base application includes tooltips for all controls and actions. In combination with descriptive captions and instructional text, the tooltips are our current implementation of *embedded user assistance*, which is an important principle in today’s world of software design.  

The tooltips help users unblock themselves by providing an answer to the most likely questions the users might have, such as “What data can I input here?” or “What is the data used for?”. Keep that in mind when you develop the user interface of your solution.  

## Help users learn more

The content that Microsoft publishes under the user assistance concept of *Learn more* is in part intended to answer those questions that the user interface (including the tooltips) cannot answer, such as where that page fits into the bigger workflow, or what comes next, or what would be the alternative, and so on.  

The base version of [!INCLUDE[prodshort](developer/includes/prodshort.md)] uses content that is published to an online library ([Docs.microsoft.com/dynamics365/business-central](/dynamics365/business-central/index)) so that it can also serve as onboarding material and as feature overviews that you can share with prospects. The content is written in MarkDown, and our source files are available in a [public GitHub repo](https://github.com/MicrosoftDocs/dynamics365smb-docs) so that you can extend and customize it for your customers.  

There are different repos in GitHub for the source content and each of the languages that Microsoft translates to. The dynamics365smb-docs repo contains the source content in English (US). If you want access to the content in other languages that are provided by Microsoft, navigate to the relevant repo. The names follow this pattern:  

```dynamics365smb-docs-pr.language-country```

For example, the Danish translation of our content is in a repo with the name [dynamics365smb-docs-pr.da-DK](https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.da-dk).  

In the source repo, [dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs), the readme.md file contains tips and tricks to get started with contributions.  

### Feedback and contributions

On docs.microsoft.com, each article has two buttons at the end of the article. The *Product feedback* button sends you to the Ideas site, and the *Sign in to give documentation feedback* button lets you submit feedback about the content through GitHub. In both cases, you must create an account if you do not already have one. For *product feedback*, you must sign in with your work or organizational email account. For *access to GitHub*, you can use any email address when you create an account.  

We welcome your contributions, both as pull requests with suggestions or corrections to the content, and as GitHub Issues with bugs or questions. But please be mindful that feedback and contributions to the *dynamics365smb-docs* repo is about the content, not about the product.  

> [!IMPORTANT]
> Microsoft accepts pull requests to the *dynamics365smb-docs* repo only, not the language-specific repos. If you have feedback about translations, you can report a GitHub issue in the relevant repo.  

Microsoft also accepts contributions and feedback about the developer and ITpro content through the [dynamics365smb-devitpro-pb](https://github.com/MicrosoftDocs/dynamics365smb-devitpro-pb). This repo does not have translation repos associated with it, but other than that, the same rules apply as for the *dynamics365smb-docs* repo.  

## Translate the Help

If you want to deliver a [localization app](../developer/readiness/readiness-develop-localization.md), or if you want to deliver your functionality in more than one country, you will want to translate the Help. To help you do that, we suggest that you take a look at the [Microsoft Dynamics 365 Translation Service](/dynamics365/unified-operations/dev-itpro/lifecycle-services/translation-service-overview), which is available as preview in the Microsoft Dynamics Life Cycle Services. For more information, see [Translate documentation files](/dynamics365/unified-operations/dev-itpro/lifecycle-services/use-translation-service-ua).  

The user assistance in the shape of tooltips and other user interface text is translated as part of the application. For more information, see [Working with Translation Files](../developer/devenv-work-with-translation-files.md).  

## See Also

[Configure the Help Experience](deployment/configure-help.md)  
[Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[ToolTip Property](../developer/properties/devenv-tooltip-property.md)  
[InstructionalText Property](../developer/properties/devenv-instructionaltext-property.md)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[Translate documentation files](/dynamics365/unified-operations/dev-itpro/lifecycle-services/use-translation-service-ua)  
[Resources for Help and Support](help-and-support.md)  
