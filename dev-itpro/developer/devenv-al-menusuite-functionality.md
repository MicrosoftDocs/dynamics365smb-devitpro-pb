---
title: "Adding Pages and Reports to Tell me"
description: "Description of how you use AL to add pages and reports so that they are discoverable through search in the client."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

 

# Adding Pages and Reports to Tell me

The [!INCLUDE[prod_short](includes/prod_short.md)] client includes the **Tell me** feature that lets users find objects and online help articles by entering search terms. When you have added a page or a report in your extension, you most likely want it to be discoverable to users in **Tell me**. In AL, you make a page or report searchable from **Tell me** by setting the [UsageCategory property](properties/devenv-usagecategory-property.md) in code. The **UsageCategory** setting will make the page or report searchable, and the value chosen for the setting will further sub categorize the item.

![TellMe](media/tellmeApril19.png)

**Tell me** finds pages and reports by searching the captions that are specified on page and report objects by the [CaptionML property](properties/devenv-caption-property.md).

## Working with the UsageCategory property

When you create a [Page](devenv-page-object.md) or a [Report](devenv-report-object.md), you add the [UsageCategory Property](properties/devenv-usagecategory-property.md). If the **UsageCategory** is set to **None**, or if you do not specify **UsageCategory**, the page or report will not show up when you search in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. 

### UsageCategory property values
The values for the **UsageCategory** property are listed below. The sub category will help the user navigate through the search results and it is a best practice to be consistent when categorizing the pages and the reports that you add. A consistent approach will help guiding the user and improve productivity.

|Value           |Description                                  |
|----------------|---------------------------------------------|
|None            |The page or report is not included in search.|
|Lists           |The page or report is listed as **Lists** under the **Pages and Tasks** category.|
|Tasks           |The page or report is listed as **Tasks** under the **Pages and Tasks** category.|
|ReportsAndAnalysis |The page or report is listed as **Reports and Analysis** under the **Reports and Analysis** category.|
|Documents       |The page or report is listed as **Documents** under the **Reports and Analysis** category.|
|History         |The page or report is listed as **Archive** under the **Reports and Analysis** category.|
|Administration  |The page or report is listed as **Administration** under the **Pages and Tasks** category.|

## Adding additional search terms

You can specify other words or phrases that can help users find a page or report by using the [AdditionalSearchTerms](../developer/properties/devenv-additionalsearchterms-property.md) and [AdditionalSearchTermsML](../developer/properties/devenv-additionalsearchtermsml-property.md) properties. If the page or report is searchable by **Tell me** (that is, th **UsageCategory** property is set a value other than `None`), the search terms specified by these properties are used in addition to the caption of the page or report. These properties are useful when the caption does not always reflect what users will look for. A good example of this in [!INCLUDE[prod_short](includes/prod_short.md)] is pages and reports associated with **Item**. Users unfamiliar with [!INCLUDE[prod_short](includes/prod_short.md)] might look for 'product' or 'merchandise' instead of 'item'.  

> [!NOTE]  
> For [!INCLUDE[prod_short](includes/prod_short.md)] on-premises, the [!INCLUDE[webserverinstance](includes/webserverinstance.md)] configuration file (navsettings.json) includes a setting called `UseAdditionalSearchTerms` that enables or disables the use of additional search terms by the **Tell me**. For more information, see [Configuring [!INCLUDE[webserver](includes/webserver.md)] Instances](../administration/configure-web-server.md#Settings).

## Example
The following example creates a `SimpleItemList` page and sets a `UsageCategory` property to the page, so that the `SimpleItemList` page is discoverable through search using the **Tell me** feature. Also, the example sets the   `AdditionalSearchTerms` property to add two search terms for the page. 

```AL
page 50210 SimpleItemList 
{ 
    PageType = List; 
    SourceTable = Item; 
    UsageCategory = Lists;
    AccessByPermission = page SimpleItemList = X;
    ApplicationArea = All;
    AdditionalSearchTerms = 'product, merchandise';

    layout 
    { 
        area(content) 
        { 
            group(General) 
            { 
                field("No.";"No.") {} 
                field(Name;Name) {} 
                field(Description;Description) {} 
            } 
        } 
    } 
} 
```

## Optional settings
In addition to making a page or report searchable, you can control the access of an object by providing **Read**, **Insert**, **Modify**, **Delete**, and **Execute** (RIMDX) permissions by adding the [AccessByPermission property](properties/devenv-accessbypermission-property.md). Likewise, control the application area access on the specified object by adding the [ApplicationArea Property](properties/devenv-applicationarea-property.md). 

The **AccessByPermission** property and **ApplicationArea** property are the optional settings, which can be applied with the **UsageCategory** property. These settings are used to set restrictions on an object when you enable the Search functionality.

## Working in the [!INCLUDE[nav_dev_long_md](includes/nav_dev_long_md.md)]

> [!NOTE]
> [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] is [!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)].

If you are using the [!INCLUDE[nav_dev_long_md](includes/nav_dev_long_md.md)], you can also set **UsageCategory**, **AdditionalSearchTerms**, **AccessByPermission**, and **ApplicationArea** properties on pages and reports to control their search.

After you change these properties by using the [!INCLUDE[nav_dev_long_md](includes/nav_dev_long_md.md)], before the changes take effect in the client, you must run **Build Object Search Index** from the **Tools** menu.

## See Also

[Adding Menus to the Navigation Pane](devenv-adding-menus-to-navigation-pane.md)  
[UsageCategory Property](properties/devenv-usagecategory-property.md)  
[Page Object](devenv-page-object.md)  
[Report Object](devenv-report-object.md)  
[AL Development Environment](devenv-reference-overview.md)
