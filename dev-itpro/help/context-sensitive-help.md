---
title: "Configure Context-Sensitive Help"
description: Learn about how to add context-sensitive Help to your Business Central solution.
author: edupont04
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 03/25/2019
---

# Configure Context-Sensitive Help

A key pillar of helping users help themselves is to give them access to Help for the particular corner of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] that they are working in.  

## App-level configuration

At an app level, you can specify where the Help for your functionality is published in the app.json file. For example, if you publish your content to `https://mysite.com/en-us/mysolution`, then you would specify that in the *contextSensitiveHelpUrl* property as shown in the following example:

```json
  "contextSensitiveHelpUrl": "https://mysite.com/documentation",

```

In this example, the *contextSensitiveHelpUrl* property specifies that the links to the Help must go to the *mysite.com* site when the user is using your app's functionality across all locales. When the user is using functionality from the base application, then the Help calls will go to the default location on the *docs.microsoft.com* site.  

If your app only supports a limited number of locales, you can specify that as well as shown in the following example:

```json
  "contextSensitiveHelpUrl": "https://mysite.com/{0}/documentation",
  "supportedLocales": [
    "en-GB", "en-IE
  ],
```

### Localization apps

Specifically for localization apps that bring [!INCLUDE [prodshort](../developer/includes/prodshort.md)] to new markets, the properties in the app.json file can be set to take over the links to Help for specific languages as shown in the following example:

```json
  "helpBaseUrl": "https://mysite.com/{0}/documentation",
  "supportedLocales": [
    "ca-es"
  ],
```

In this example, the *helpBaseUrl* and *supportedLocales* properties specify that the links to the Help must go to the *mysite.com* site when the user is using the product in either English (Ireland) or English (United Kingdom). If the user switches the application language to English (US), then the Help calls will go to the default location on the *docs.microsoft.com* site.  

## Page-level configuration

Your target website is expected to have a default page that will display if nothing else is specified. But for each page or page extension, and for each field or field group on those pages, you can then specify the exact Help page that describes this page or field. You can do that using the *ContextSensitiveHelpPage* property as shown in the following example:

```
page 50101 "Reward Card"
{
    PageType = Card;
    SourceTable = Reward;
    ContextSensitiveHelpPage = 'sales-rewards';

}
```

In this example, the app contains a page object that is mapped to the *sales-rewards* Help file on the website that the app.json specifies. As a result, the *Learn more* link in the tooltips for this page will go to the equivalent of *https://mysite.com/documentation/sales-rewards*.  

You can use the *ContextSensitiveHelpPage* property to direct all Help calls to the same article, or to group the Help calls based on individual features or workflows. For example, Microsoft has chosen to group the context-sensitive links depending on the granularity of the Help for specific area in the base application. If the Help for a specific area is made more granular, then the context-sensitive Help mapping is updated accordingly.  

You can set the *ContextSensitiveHelpPage* property on all pages, or only on those that you don't want to get the default Help page for your website. For page extensions, the value of the *ContextSensitiveHelpPage* property will apply only to the controls that the page extension adds to the extended page objects. For example, if your page extension adds two new controls to the base application's Customer Card page, then the *Learn more* links in the tooltips for those two controls will go to the Help page that you have specified, and the *Learn more* links in the rest of the controls will go to the default Help that is specified in the base application. This way, multiple apps can extend the same page object and each apply their own content-sensitive Help link without overwriting the context-sensitive links for other apps.  

In contrast, the app.json file also contains a *help* property, but this specifies the link that describes the app or solution itself and is used by AppSource.  

### How it works for the base application

In the current version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], the context-sensitive links to Help for the base application works in a different way that is based on a UI-to-Help mapping that is stored in table 2000000198 **Page Documentation**. In this table, all page objects in the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are listed, and have a target Help article associated with each of them. This means that multiple page objects can be associated with the same Help article, such as when a specific workflow involves multiple pages.  

The table associates page IDs with target articles, but the URL to where to find the target article is specified at the application level that defaults to the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/en-us/dynamics365/business-central/) site. In an extension, you can overrule this URL so that all calls for Help go to your site instead, for example. This is especially important for localization apps where all context-sensitive Help calls for that app's language must go to that app provider's website.  

## See also

[User Assistance Model](../user-assistance.md)  
[Resources for Help and Support for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../help-and-support.md)  
[Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Migrate Legacy Help to the Business Central Format](../upgrade/migrate-help.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[Blog post: Extending and customizing the Help](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/11/extending-and-customizing-help)  
[Blog post: Collaborate on content for Business Central](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/15/collaborate-on-content-for-business-central)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
