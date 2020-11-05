---
title: "Configure Context-Sensitive Help"
description: Learn about how to add context-sensitive Help to your Business Central solution.
author: edupont04
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 10/01/2020
---

# Configure Context-Sensitive Help

A key pillar of helping users help themselves is to give them access to Help for the particular part of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] that they are working in.  

## App-level configuration

Specify where the Help for your functionality is published in the *contextSensitiveHelpUrl* property in the app.json file. For example, if you publish your content to `https://mysite.com/documentation`:

```json
  "contextSensitiveHelpUrl": "https://mysite.com/documentation/",

```

In this example, when the user is using your app's functionality, the *contextSensitiveHelpUrl* property specifies that the links to Help will go to the *mysite.com* site. When the user is using functionality from the base application, then the Help calls will go to the *docs.microsoft.com* site.  

If your app only supports a limited number of locales, you can specify that as well as shown in the following example:

```json
  "contextSensitiveHelpUrl": "https://mysite.com/{0}/documentation/",
  "supportedLocales": [
    "en-GB", "en-IE
  ],
```

The *contextSensitiveHelpUrl* and *supportedLocales* properties specify that the links to the Help for page objects in this app must go to the *mysite.com* site, but that the site only supports those two languages. All other Help calls from objects in this app will go to the default locale on the specified webserver,  in this case the equivalent of `https://mysite.com/en-GB/documentation/my-feature`.    

Help calls for Microsoft objects will continue to go to the *docs.microsoft.com* site.  

### Localization apps

Specifically for localization apps that translate [!INCLUDE [prodshort](../developer/includes/prodshort.md)] into languages that are not offered by Microsoft, the app.json file must be set to specify the destination of links to Help as shown in the following example:

```json
  "helpBaseUrl": "https://mysite.com/{0}/documentation/",
  "supportedLocales": [
    "ca-es"
  ],
```

The *helpBaseUrl* and *supportedLocales* properties specify that the links to the Help must go to the *mysite.com* site when the user is using the product in Catalan. If the user switches the application language to English (US), then the Help calls will go to the *docs.microsoft.com* site.  

## Page-level configuration

Your target website is expected to have a default page that will display if nothing else is specified. But for each page or page extension in your app, you can specify the Help page that describes this page or the fields that the page extension adds to the page. You can do that using the *ContextSensitiveHelpPage* property as shown in the following example:

```AL
page 50101 "Reward Card"
{
    PageType = Card;
    SourceTable = Reward;
    ContextSensitiveHelpPage = 'sales-rewards';

}
```

In this example, the app contains a page object that is mapped to the *sales-rewards* Help file on the website that the app.json specifies. As a result, the *Learn more* link in the tooltips for this page will go to the equivalent of `https://mysite.com/documentation/sales-rewards`.  

Similarly, the following code example shows a page extension object that sets the *ContextSensitiveHelpPage* property so that the *Learn more* link in tooltips for the fields that this page extension adds to the Customer Card will go to the `https://mysite.com/documentation/sales-rewards` rather than the default location at docs.microsoft.com:

```AL
pageextension 50104 "Customer Card Ext" extends "Customer Card"
{
    ContextSensitiveHelpPage = 'sales-rewards';
    layout
    {...}
}
```

You can use the [ContextSensitiveHelpPage property](../developer/properties/devenv-contextsensitivehelppage-property.md) to direct Help calls from multiple page objects or actions to the same article. For example, Microsoft has chosen to group the context-sensitive links depending on the granularity of the Help for specific area in the base application. If the Help for a specific area is made more granular, then the context-sensitive Help mapping is updated accordingly.    

Your target website is expected to have a default page that will display if no other page is appropriate. For every page where *ContextSensitiveHelpPage* is not set, this default Help page will be shown.  

For page extensions, the value of the *ContextSensitiveHelpPage* property will apply only to the controls that the page extension adds to the extended page objects. For example, if your page extension adds two new controls to the base application's Customer Card page, then the *Learn more* links in the tooltips for those two controls will go to the Help page that you have specified. The *Learn more* links in the rest of the controls will go to the default Help that is specified in the base application. This way, multiple apps can extend the same page object and each apply their own content-sensitive Help link without overwriting the context-sensitive links for other apps.  

> [!NOTE]
> The app.json file also contains a *help* property that is used by AppSource to specify the link that describes the app or solution.  

### How it works for the base application

In the current version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], the context-sensitive links to Help for the base application is based on a different UI-to-Help mapping that is stored in table 2000000198 **Page Documentation**. In this table, all page objects in the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are listed, and have a target Help article associated with each of them. Multiple page objects can be associated with the same Help article, such as when a specific workflow involves multiple pages.  

The base URL to the location of the target articles that are listed in table 2000000198 **Page Documentation** is specified at the app level as [https://docs.microsoft.com/dynamics365/business-central/](/dynamics365/business-central/). In an extension, you can overrule this URL so that all calls for Help go to your site instead. This is especially important for localization apps where all context-sensitive Help calls for that app's language must go to the provider's website. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).  

### Adding page-level UI-to-Help mapping to the system table

You can run a script that populates the **Page Documentation** table with a mapping for Microsoft's page objects and your own page objects. This is useful if you want to reuse legacy [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] Help for your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises deployment.  

> [!CAUTION]
> While it is possible to reuse the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] legacy Help with the legacy [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] Help Server, and to populate the system table, **Page Documentation**, we recommend that you convert any existing content to the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] format, and that you fork our GitHub repos. For more information, see [Extend, Customize, and Collaborate on the Help for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](contributor-guide.md) and [Migrate Legacy Help to the [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Format](../upgrade/migrate-help.md).  

In the following example, you have chosen not to apply context-sensitive Help links to your page objects and instead you want to overwrite the UI-to-Help mapping that Microsoft has made in the system table.  

Let's assume that the current mapping is:

|Page ID  |Page Name  |Region/Country  |Relative Path  |
|---------|-----------|----------------|---------------|
|4     |Payment Terms |W1              |sales-manage-sales|
|11300 |Financial Journal  |BE         |how-to-create-financial-journals |

You want to replace the values of the fields in the **Relative Path** column with classic page-level Help files:

|Page ID  |Page Name  |Region/Country  |Relative Path  |
|---------|-----------|----------------|---------------|
|4     |Payment Terms |W1              |N_4|
|11300 |Financial Journal  |BE         |N_11300 |

Once you have done this mapping, you can apply it to the **Page Documentation** table by using a script that updates the table in the SQL Server database, for example.  

You can find a couple of suggestions for how to go about this in our blog post, [Blog post: Reusing classic object-based Help on your Dynamics 365 Business Central Help Server](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/13/reusing-classic-object-based-help-dynamics-365-business-central-help-server/).

## See also

[User Assistance Model](../user-assistance.md)  
[Resources for Help and Support for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../help-and-support.md)  
[Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Migrate Legacy Help to the Business Central Format](../upgrade/migrate-help.md)  
[Building Your First Sample Extension With Extension Objects, Install Code, and Upgrade Code](../developer/devenv-extension-example.md)  
[Building an Advanced Sample Extension](../developer/devenv-extension-advanced-example.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[JSON Files](../developer/devenv-json-files.md)  
[Blog post: Extending and customizing the Help](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/extending-and-customizing-the-help-in-dynamics-365-business-central)  
[Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/)  
[Blog post: Reusing classic object-based Help on your Dynamics 365 Business Central Help Server](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/13/reusing-classic-object-based-help-dynamics-365-business-central-help-server/)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
