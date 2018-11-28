---
title: Configure the Help experience
description: You can override the default location for Help to point at your own website.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 10/24/2018
ms.author: edupont
---

# Configuring the Help Experience for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

The default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] comes with conceptual overviews and other articles that publish to the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/en-us/dynamics365/business-central/) site. This location is then accessible from the Help menu and through the Learn More links in all tooltips. Each extension that you add will include its own tooltips and links to Help. But what if you want to deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] locally? Or if you have a vertical solution so that you want to refer your customers to your own website for Help? Or if you have a legacy Help collection based on the Dynamics NAV Help Server?  

These and other scenarios are also supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. But the options and possibilities are different, depending on your deployment scenario.  

## User assistance for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

The user assistance model is based on the following principles:

- Get started

    Default values and setup wizards makes it easy to start using [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with your own data, in-product videos give new users a quick introduction to how the product works, and Home pages give easy access to key tasks so each user is more productive.
- Get unblocked

    Embedded user assistance implemented as tooltips answers most immediate questions about what fields and actions do.
- Learn more

    The Help menu and the tooltips provide context-sensitive links to Help articles with more information.

Apps and other extensions are expected to follow the same model by applying tooltips to controls on page objects, and by providing links to Help for their functionality.  

### Context-sensitive Help

The context-sensitive links to Help are based on a UI-to-Help mapping that is stored in table 2000000198 **Page Documentation**. In this table, all page objects in the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are listed, and have a target Help article associated with each of them. This means that multiple page objects can be associated with the same Help article, such as when a specific workflow involves multiple pages.  

The table associates page IDs with target articles, but the URL to where to find the target article is specified at the application level that defaults to the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/en-us/dynamics365/business-central/) site. In an extension, you can overrule this URL so that all calls for Help go to your site instead, for example. This is especially important for localization apps where all context-sensitive Help calls for that app's language must go to that app provider's website.  

At an app level, the properties in the app.json file can be set to take over the links to Help for specific languages as shown in the following example:

```json
  "helpBaseUrl": "https://mysite.com/{0}/mysolution",
  "supportedLocales": [
    "en-GB", "en-IE
  ],
```

In this example, the *helpBaseUrl* and *supportedLocales* properties specify that the links to the Help must go to the *mysite.com* site when the user is using the product in either English (Ireland) or English (United Kingdom). If the user switches the application language to English (US), then the Help calls will go to the default location on the *docs.microsoft.com* site. In contrast, the *help* property specifies the link that describes the app or solution itself and is used in AppSource.

Alternatively, you can specify help links at the object level. For more information, see [Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md).  

### Tooltips

In combination with descriptive captions and instructional text, tooltips are our current implementation of *embedded user assistance*, which is an important principle in today’s world of software design. The tooltips are there to help users unblock themselves by providing an answer to the most likely questions the users might have, such as “What data can I input here?” or “What is the data used for?”.  

The base application has set the Tooltip property for all controls on (almost) all page objects. Most system actions also include tooltips so that users get a consistent experience. Your extensions are expected to also include tooltips for the same reason. For more information, see [ToolTip Property](../developer/properties/devenv-tooltip-property.md).  

### Instructional text

The base application has applied instructional text to setup guides and certain other types of page objects. Your extensions are expected to also include instructional text to setup guides for the same reason. For more information, see [InstructionalText Property](../developer/properties/devenv-instructionaltext-property.md).  

### Example

The following example shows how you can apply user assistance and link to Help in a page object:

```
page 50100 MyPage
{
    PageType = Card;
    SourceTable = MyTable;
    HelpLink = 'https://docs.microsoft.com/{0}/dynamics365/get-started/training/index';


    layout
    {
        area(content)
        {
            group(Test)
            {
                InstructionalText = 'Add an entity from your list of contacts. The entity can be a person or a company.';
                field(ID; ID)
                {
                    ApplicationArea = All;
                    Caption = 'First field';
                    ToolTip = 'Shows the ID of the entity. You must set the ID manually when you add an entity, and it can be a maximum of 10 characters long.';
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                    Caption = 'Second field';
                    ToolTip = 'Shows the name of the entity based on the names in your list of contacts.';
                }
            }
        }
    }
}

```

## On-premises deployments

For deploying [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, you must choose between using the legacy Dynamics NAV Help Server or an online website. Help Server is a simple website that requires your Help to be in a specific format (HTML files), and the online website can host any content that you want to make available. Your choice depends on the concrete needs of your solution and your users.  

> [!IMPORTANT]
> You can configure each client to use either an online library or Help Server. If you add configuration for an online library, you must remove the settings for Help Server.  

### Online library

If you want to use a website that is not based on Help Server, then you must specify the URL in the settings for the Web client and the Windows client, if your company uses this legacy client. The website does not have to be publicly accessible, but it must be accessible to all users of the solution that it support.  

For the Web client, which is accessed by users from a browser or from the mobile apps, the navsettings.json file must contain the following settings:

```
                           "//BaseHelpUrl":  "The location of Help for this application.",
                           "BaseHelpUrl": "https://docs.microsoft.com/{0}/dynamics365/business-central/",
                           "//BaseHelpSearchUrl":  "The URL to use if Help is included in the Search functionality in Business Central.",
                           "BaseHelpSearchUrl": "https://docs.microsoft.com/{0}/search/index?search={1}&scope=BusinessCentral",
                           "//DefaultRelativeHelpPath":  "The Help article to look up if no other article can be found.",
                           "DefaultRelativeHelpPath": "index",
```

For users who use the legacy Windows client connected to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the ClientUserSettings.config file must contain the following settings:

```
    <add key="BaseHelpUrl" value="https://docs.microsoft.com/{0}/dynamics365/business-central/" />
    <add key="DefaultRelativeHelpPath" value="index" />
```

> [!NOTE]
> Replace the value of the BaseHelpUrl key with the URL for your own website, such as ```https://mycompany.com/{0}/documentation/```. The parameter, {0}, represents the locale of the browser that the user is using, such as en-us or da-dk, and is set automatically at runtime.

### Help Server

If you want to use Help Server, then you must specify the server and port in the installation options. The Help Server website can also serve as a starting point for adding a library to your existing website, for example.  

For the Web client, which is accessed by users from a browser or from the mobile apps, the navsettings.json file must contain the following settings:

```
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
In both examples, https://myserver.com represents the URL to the Help Server instance. For more information, see [Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server).  

> [!IMPORTANT]
> If you use Help Server, the functionality for providing context-sensitive links to Help article does not work. Instead, you must rely on the legacy Help lookup mechanism that hinges on .HTM files with filenames that reflect the object IDs, such as N.123.htm. For more information, see [Working with Dynamics NAV Help Server](/dynamics-nav/microsoft-dynamics-nav-help-server).  

## See Also

[Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Working with Dynamics NAV Help Server](/dynamics-nav/microsoft-dynamics-nav-help-server)  
[Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server)  
[Upgrade Dynamics NAV Help](../upgrade/migrate-help.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[System Requirements](system-requirement-business-central.md)  
