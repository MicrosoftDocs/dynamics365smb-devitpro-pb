---
title: "UsageCategory Property"
description: "Description of how you use AL to add pages and reports to Tell me in the client using the UsageCategory property."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# UsageCategory Property
AL provides navigational support for pages and reports in the client. You enable a page or report to be discoverable through **Tell me** in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] by using the **UsageCategory** property. For more information, see [Adding Pages and Reports to Tell Me](../devenv-al-menusuite-functionality.md).

## Property Values
The values for the **UsageCategory** property are listed below. The **UsageCategory** property makes the page or report searchable and further sub categorizes it in the list of search results when the user has used the **Tell me** functionality.

|Value           |Description                                  |
|----------------|---------------------------------------------|
|None            |The page or report is not included in a search.|
|Lists           |The page or report is listed as **Lists** under the **Pages and Tasks** category.|
|Tasks           |The page or report is listed as **Tasks** under the **Pages and Tasks** category.|
|ReportsAndAnalysis |The page or report is listed as **Reports and Analysis** under the **Reports and Analysis** category.|
|Documents       |The page or report is listed as **Documents** under the **Reports and Analysis** category.|
|History         |The page or report is listed as **Archive** under the **Reports and Analysis** category.|
|Administration  |The page or report is listed as **Administration** under the **Pages and Tasks** category.|

## Remarks
If the **UsageCategory** is set to **None**, or if you do not specify **UsageCategory**:
- the page or report will not show up when you use the search functionality.  
- users will not be able to bookmark a link to the page or report object from the user interface.


## Syntax

```
UsageCategory = ReportsAndAnalysis;  
```

## Dependent Properties
The [AccessByPermission property](devenv-accessbypermission-property.md) and [ApplicationArea Property](devenv-applicationarea-property.md) are optional properties, which can be applied to set restrictions on an object accessibility, when you add the **UsageCategory** property. 

## See Also
[Adding Pages and Reports to Tell me](../devenv-al-menusuite-functionality.md)  
[Properties](devenv-properties.md)   
[Page Object](../devenv-page-object.md)  
[Report Object](../devenv-report-object.md)  
