---
title: "Adding Pages and Reports to Search"
description: "Description of how you use AL to add pages and reports to Search in the client."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Adding Pages and Reports to Search
AL provides navigational support for pages and reports in the client. You enable a page or report to be available through Search in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] using the **UsageCategory** setting. 

## Working with Search
When you create a [Page](devenv-page-object.md) or a [Report](devenv-report-object.md), you add the [UsageCategory Property](properties/devenv-usagecategory-property.md). If the **UsageCategory** is set to **None**, or if you do not specify **UsageCategory**, the page or report will not show up when you use the Search functionality in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. 

## UsageCategory property values
The values for the UsageCategory property are listed below: 

- None
- Lists
- Tasks
- ReportsAndAnalysis
- Documents
- History
- Administration

## Example
The following example creates a ``SimpleCustomerCard`` page and sets a ``UsageCategory`` property to the page, so that the ``SimpleCustomerCard`` page is enabled in Search. 


```
page 70050088 SimpleCustomerCard 
{ 
    PageType = Card; 
    SourceTable = Customer; 
    UsageCategory = Documents;  
    AccessByPermission = page SimpleCustomerCard = X;
    ApplicationArea = All;
    layout 
    { 
        area(content) 
        { 
            group(General) 
            { 
                field("No.";"No.") {} 
                field(Name;Name) {} 
                field(Address;Address) {} 
            } 
        } 
    } 
} 
```

## Optional accessibility settings
You can add a page or a report to Search. Additionally, control the accessibility of an object by providing **Read**, **Insert**, **Modify**, **Delete** and **Execute** (RIMDX) permissions by adding the [AccessByPermission property](properties/devenv-accessbypermission-property.md). Likewise, control the application area access on the specified object by adding the [ApplicationArea Property](properties/devenv-applicationarea-property.md). 

The **AccessByPermission** property and **ApplicationArea** property are the optional settings, which can be applied with the **UsageCategory** property. These settings are used to set restrictions on an object when you enable the Search functionality. 


## See Also
[Adding Menus to the Navigation Pane](devenv-adding-menus-to-navigation-pane.md)  
[MenuSuite Properties](properties/devenv-menusuite-properties.md)   
[Page Object](devenv-page-object.md)  
[Report Object](devenv-report-object.md)  
[AL Development Environment](devenv-reference-overview.md)
