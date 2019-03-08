---
title: Configure the Help experience
description: Learn how to give your customers access to the right Help content.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 03/08/2019
ms.author: edupont
---

# Configuring the Help Experience for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

The default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] comes with conceptual overviews and other articles that publish to the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/en-us/dynamics365/business-central/) site. This location is then accessible from the Help menu and through the Learn More links in all tooltips. Each extension that you add will include its own tooltips and links to Help. But what if you want to deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] locally? Or if you have a vertical solution so that you want to refer your customers to your own website for Help? Or if you have a legacy Help collection based on the Dynamics NAV Help Server?  

These and other scenarios are also supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. But the options and possibilities are different, depending on your deployment scenario.  

## Apps for online tenants

When you build an app for in[!INCLUDE [prodshort](../developer/includes/prodshort.md)] using the AL developer experience, you are expected to comply with the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user assistance model. This includes tooltips and context-sensitive links to Help.  

For more information, see [User Assistance Model](../user-assistance.md).  

### Context-sensitive Help

A key pillar of helping users help themselves is to give them access to Help for the particular corner of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] that they are working in.  

At an app level, you can specify where the Help for your functionality is published in the app.json file. For example, if you publish your content to `https://mysite.com/en-us/mysolution`, then you would specify that in the *contextSensitiveHelpUrl* property as shown in the following example:

```json
  "contextSensitiveHelpUrl": "https://mysite.com/documentation",

```

In this example, the *contextSensitiveHelpUrl* property specifies that the links to the Help must go to the *mysite.com* site when the user is using your app's functionality across all locales. When the user is using functionality from the base application, then the Help calls will go to the default location on the *docs.microsoft.com* site.  

If your app only supports a limited number of locales, you can specify that as well as shown in the following example:

```json
  "contextSensitiveHelpUrl": "https://mysite.com/{0}/documentation",
  "supportedLocales": [
    "en-GB"
  ],
```

Your target website is expected to have a default page that will display if nothing else is specified. But for each page or page extension, and for each field or field group on those pages, you can then specify the exact Help page that describes this page or field. You can do that using the *ContextSensitiveHelpPage* property as shown in the following example:

```
page 50101 "Reward Card"
{
    PageType = Card;
    SourceTable = Reward;
    ContextSensitiveHelpPage = 'sales-rewards';

}
```

In this example, the app contains a page object that is mapped to the *sales-rewards* Help file on the website that the app.json specifies. As a result, the *Learn more* link in the tooltips for this page will go to the equivalent of *https://mysite.com/en-GB/documentation/sales-rewards*.

You can set the *ContextSensitiveHelpPage* property on all pages, or only on those that you don't want to get the default Help page for your website. For page extensions, the value of the *ContextSensitiveHelpPage* property will apply only to the 

In contrast, the app.json file also contains a *help* property, but this specifies the link that describes the app or solution itself and is used by AppSource.  

#### How it works for the base application

In the current version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], the context-sensitive links to Help for the base application works in a different way that is based on a UI-to-Help mapping that is stored in table 2000000198 **Page Documentation**. In this table, all page objects in the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are listed, and have a target Help article associated with each of them. This means that multiple page objects can be associated with the same Help article, such as when a specific workflow involves multiple pages.  

The table associates page IDs with target articles, but the URL to where to find the target article is specified at the application level that defaults to the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/en-us/dynamics365/business-central/) site. In an extension, you can overrule this URL so that all calls for Help go to your site instead, for example. This is especially important for localization apps where all context-sensitive Help calls for that app's language must go to that app provider's website.  

### Tooltips

In combination with descriptive captions and instructional text, tooltips are our current implementation of *embedded user assistance*, which is an important principle in today’s world of software design. The tooltips are there to help users unblock themselves by providing an answer to the most likely questions the users might have, such as “What data can I input here?” or “What is the data used for?”.  

The base application has set the Tooltip property for all controls on (almost) all page objects. Most system actions also include tooltips so that users get a consistent experience. Your extensions are expected to also include tooltips for the same reason. For more information, see [ToolTip Property](../developer/properties/devenv-tooltip-property.md).  

### Instructional text

The base application has applied instructional text to setup guides and certain other types of page objects. Your extensions are expected to also include instructional text to setup guides for the same reason. For more information, see [InstructionalText Property](../developer/properties/devenv-instructionaltext-property.md).  

### Example

The following example shows how you can apply user assistance and link to Help in a page object:

```
page 50101 "Reward Card"
{
    PageType = Card;
    SourceTable = Reward;
    ContextSensitiveHelpPage = 'sales-rewards';

    layout
    {
        area(content)
        {
            group(Reward)
            {
                InstructionalText = 'Fill in the fields so that you can reward customers with discounts.';
                field("Reward Id"; "Reward ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID of the reward.';
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies what this type of reward is used for.';
                }

                field("Discount Percentage"; "Discount Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the impact of the reward on the customer''s price.';
                }
            }
        }
    }
}
```

### Localization apps

Specifically for localization apps that bring [!INCLUDE [prodshort](../developer/includes/prodshort.md)] to new markets, the properties in the app.json file can be set to take over the links to Help for specific languages as shown in the following example:

```json
  "helpBaseUrl": "https://mysite.com/{0}/documentation",
  "supportedLocales": [
    "en-GB", "en-IE
  ],
```

In this example, the *helpBaseUrl* and *supportedLocales* properties specify that the links to the Help must go to the *mysite.com* site when the user is using the product in either English (Ireland) or English (United Kingdom). If the user switches the application language to English (US), then the Help calls will go to the default location on the *docs.microsoft.com* site.  

## On-premises deployments

For deploying [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, you must choose between using the legacy Dynamics NAV Help Server or an online website. Help Server is a simple website that requires your Help to be in a specific format (HTML files), and the online website can host any content that you want to make available. Your choice depends on the concrete needs of your solution and your users.  

> [!IMPORTANT]
> You can configure each client to use either an online library or Help Server. If you add configuration for an online library, you must remove the settings for Help Server.  

### Online library

If you want to use a website that is not based on Help Server, then you must specify the URL in the settings for the Web client and the Windows client, if your company uses this legacy client. The website does not have to be publicly accessible, but it must be accessible to all users of the solution that it support.  

For the Web client, which is accessed by users from a browser or from the mobile apps, the navsettings.json file must contain the following settings:

```json
                           "//BaseHelpUrl":  "The location of Help for this application.",
                           "BaseHelpUrl": "https://mysite.com/{0}/documentation/",
                           "//BaseHelpSearchUrl":  "The URL to use if Help is included in the Search functionality in Business Central.",
                           "BaseHelpSearchUrl": "https://docs.microsoft.com/{0}/search/index?search={1}&scope=BusinessCentral",
                           "//DefaultRelativeHelpPath":  "The Help article to look up if no other article can be found.",
                           "DefaultRelativeHelpPath": "index",
```

For users who use the legacy Windows client connected to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the ClientUserSettings.config file must contain the following settings:

```
    <add key="BaseHelpUrl" value="https://mysite.com/{0}/documentation/" />
    <add key="DefaultRelativeHelpPath" value="index" />
```

> [!NOTE]
> Replace the value of the BaseHelpUrl key with the URL for your own website, such as ```https://mysite.com/{0}/documentation/```. The parameter, {0}, represents the locale of the browser that the user is using, such as en-us or da-dk, and is set automatically at runtime.

### Help Server

If you want to use Help Server, then you must specify the server and port in the installation options. The Help Server website can also serve as a starting point for adding a library to your existing website, for example.  

For the Web client, which is accessed by users from a browser or from the mobile apps, the navsettings.json file must contain the following settings:

```json
                           "//HelpServer": [
                                                   "Name of the Dynamics NAV Help Server to connect to."
                                            ],
                           "HelpServer": "https://myserver.com",
                           "//HelpServerPort":  "The listening TCP port for the Dynamics NAV Help Server. Valid range: 1-65535",
                           "HelpServerPort": "49000",
```

For users who use the legacy Windows client connected to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the ClientUserSettings.config file must contain the following settings:

```
    <add key="HelpServer" value="https://myserver.com" />
    <add key="HelpServerPort" value="49000" />
```

In both examples, *https://myserver.com* represents the URL to the Help Server instance. For more information, see [Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server) in the developer and ITpro content for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)].  

> [!IMPORTANT]
> If you use Help Server, the UI-to-Help mapping functionality that was described in the [Context-sensitive Help](#context-sensitive-help) section does not work. Instead, you must rely on the legacy Help lookup mechanism that hinges on .HTM files with filenames that reflect the object IDs, such as N_123.htm for the page object with the ID 123. For more information, see [Working with Dynamics NAV Help Server](/dynamics-nav/microsoft-dynamics-nav-help-server?target=_blank).  

For guidance about how to generate HTML files, see the [Readme.md in the public source repo for the business functionality content](https://github.com/MicrosoftDocs/dynamics365smb-docs?target=_blank#building-html-files). Optionally, you can choose to reuse the HTML and .HTM files that you used for Dynamics NAV in your online library or Help Server deployment.  

## Fork the Microsoft repo

If you want to customize or extend the Microsoft Help, you can fork our public repo for either the source repo in English (US) at [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs), or one of the related repos with translations into the supported languages. The readme.md file in the source repo provides tips and tricks for working with the Microsoft GitHub repos and MarkDown.  

When Microsoft publishes an update to the content, the *live* branch in the corresponding GitHub repo is updated. The source repo is updated monthly, and the related language-specific repos are updated less frequently as new translations are made available. You can choose to update your fork with updates from the Microsoft repo on a monthly or less frequent basis depending on your preferred work processes. The GitHub platform and tooling will help you manage any potential merge conflicts if you have made changes to the same files as Microsoft has. For more information, see [Fork a repo](https://help.github.com/articles/fork-a-repo/).  

> [!TIP]
> You are not required to make your GitHub repos public. When you fork a public repo, you can specify in the settings for the new repo if the repo is public, private, or available only to specific GitHub accounts.

## See Also

[User Assistance Model](../user-assistance.md)  
[Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Working with Dynamics NAV Help Server](/dynamics-nav/microsoft-dynamics-nav-help-server)  
[Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server)  
[Migrate Legacy Help to the Business Central Format](../upgrade/migrate-help.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[System Requirements](system-requirement-business-central.md)  
[Resources for Help and Support](../help-and-support.md)  
[Blog post: Extending and customizing the Help](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/11/extending-and-customizing-help)  
[Blog post: Collaborate on content for Business Central](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/15/collaborate-on-content-for-business-central)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
