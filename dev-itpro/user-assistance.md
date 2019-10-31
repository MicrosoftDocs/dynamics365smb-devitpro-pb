---
title: User assistance model
description: Learn about the user assistance model for Dynamics 365 Business Central and how your solution can comply with it.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 10/01/2019
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

### Guidelines for tooltip text

The Microsoft user assistance model requires a tooltip for all controls of type Action and Field that exist on page objects. Follow these guidelines:

- If the control is a field, begin with the verb *Specifies*.
- If the control is an action, begin with a verb in the imperative form , such as *Calculate* or *View*.
- Include the most valuable information that users need to perform the task(s) that the field or action supports.
- Ensure relevance. </br>For example, for the Post action, do not write *Post the document.* Write, for example, *Update ledgers with the amounts and quantities on the document or journal lines.*.  
- Describe complex options in tooltips for option fields. </br>Use a colon to call out the option name and its description. See example 3 below.
- Try to not exceed 200 characters including spaces. </br>This makes the tooltip easier to scan so the user can get unblocked quickly. However, the UI will render longer tooltip text if you want to provide more detailed user assistance.  
- Do not make line breaks in the tooltip text. </br>The UI cannot render formatting or line breaks in tooltips.

**Examples:**

|Control Name  |Tooltip  |
|---------|---------|
|**Password** field |Specifies your company’s password to the service that converts bank data. The password that you enter in this field must be the same as on the service provider’s sign-on page. </br>(175 characters including spaces) |
|**Entries** action |View the history of transactions that have been posted for the customer.</br> (72 characters including spaces)|
|**Account Type** field|Specifies the purpose of the account. Total: Used to total a series of balances on accounts from many different account groupings. To use Total, leave this field blank. Begin-Total: A marker for the beginning of a series of accounts to be totaled that ends with an End-Total account. End-Total: A total of a series of accounts that starts with the preceding Begin-Total account. The total is defined in the Totaling field. </br>(522 characters including spaces)|

## Help users learn more

The content that Microsoft publishes under the user assistance concept of *Learn more* is in part intended to answer those questions that the user interface (including the tooltips) cannot answer, such as where that page fits into the bigger workflow, or what comes next, or what would be the alternative, and so on.  

The base version of [!INCLUDE[prodshort](developer/includes/prodshort.md)] uses content that is published to an online library ([Docs.microsoft.com/dynamics365/business-central](/dynamics365/business-central/index)) so that it can also serve as onboarding material and as feature overviews that you can share with prospects. The content is written in MarkDown, and our source files are available in a [public GitHub repo](https://github.com/MicrosoftDocs/dynamics365smb-docs) so that you can extend and customize it for your customers.  

There are different repos in GitHub for the source content and each of the languages that Microsoft translates to. For more information, see [Extend, Customize, and Collaborate on the Help](help/contributor-guide.md).  

### Feedback and contributions

On docs.microsoft.com, each article has two buttons at the end of the article. The *Product feedback* button sends you to the Ideas site, and the *Sign in to give documentation feedback* button lets you submit feedback about the content through GitHub. In both cases, you must create an account if you do not already have one. For *product feedback*, you must sign in with your work or organizational email account. For *access to GitHub*, you can use any email address when you create an account.  

We welcome your contributions, both as pull requests with suggestions or corrections to the content, and as GitHub Issues with bugs or questions. But please be mindful that feedback and contributions to the *dynamics365smb-docs* repo is about the content, not about the product.  

> [!IMPORTANT]
> Microsoft accepts pull requests to the *dynamics365smb-docs* repo only, not the language-specific repos. If you have feedback about translations, you can report a GitHub issue in the relevant repo.  

Microsoft also accepts contributions and feedback about the developer and ITpro content through the [dynamics365smb-devitpro-pb](https://github.com/MicrosoftDocs/dynamics365smb-devitpro-pb). This repo does not have translation repos associated with it, but other than that, the same rules apply as for the *dynamics365smb-docs* repo.  

For more information, see [Extend, Customize, and Collaborate on the Help](help/contributor-guide.md).  

### Working in MarkDown

If you fork one of our repos, you will be authoring in something called MarkDown. We recommend that you learn the basics by referring to the Docs contributor guide. For more information, see [How to use Markdown for writing Docs](/contribute/how-to-write-use-markdown).  

The team that built the Docs.microsoft.com site have also developed an extension for Visual Studio Code that helps with MarkDown validation, for example. For more information, see [Docs Authoring Pack for VS Code](/contribute/how-to-write-docs-auth-pack). However, you can also use other text editors.  

For other tips and tricks, see [Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/).  

## Translate the Help

If you want to deliver a [localization app](developer/readiness/readiness-develop-localization.md), or if you want to deliver your functionality in more than one country, you will want to translate the Help. To help you do that, we suggest that you take a look at the [Microsoft Dynamics 365 Translation Service](/dynamics365/unified-operations/fin-ops-core/dev-itpro/lifecycle-services/translation-service-overview), which is available as preview in the Microsoft Dynamics Life Cycle Services. For more information, see [Translate documentation files](/dynamics365/unified-operations/fin-ops-core/dev-itpro/lifecycle-services/use-translation-service-ua).  

The user assistance in the shape of tooltips and other user interface text is translated as part of the application. For more information, see [Working with Translation Files](developer/devenv-work-with-translation-files.md).  

## Style

At Microsoft, we are in process of updating our style guides. If you have a partner account, you can get access to the Microsoft style guides on the [Microsoft Style Guides platform](https://styleguides.azurewebsites.net/). You can then download the style guide that you want and share that local copy with colleagues.  

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
[Style Guide for Microsoft Dynamics NAV (requires login)](https://styleguides.azurewebsites.net/StyleGuide/Read?id=2748)  
[Microsoft Cloud Style Guide (requires login)](https://styleguides.azurewebsites.net/StyleGuide/Read?id=2696)  
