---
title: "UsageCategory Property"
description: "Description of how you use AL to add pages and reports to Search in the client using the UsageCategory property."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

# UsageCategory Property
AL provides navigational support for pages and reports in the client. You enable a page or report to be available through search in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] by using the **UsageCategory** property. The search functionality is displayed in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] in the upper right corner with a light bulb and the text **Tell me what you want to do**. For more information about the search functionality in AL, see [Adding Pages and Reports to Search](../devenv-al-menusuite-functionality.md).

## Property Values
The values for the UsageCategory property are listed below. The UsageCategory categorizes the given page or report in the Search 

|Value           |Description                                  |
|----------------|---------------------------------------------|
|None            |The page or report is not included in search.|
|Lists           |The page or report is listed as **Lists** under the **Pages and Tasks** category.|
|Tasks           |The page or report is listed as **Tasks** under the **Pages and Tasks** category.|
|ReportsAndAnalysis |The page or report is listed as **Reports and Analysis** under the **Reports and Analysis** category.|
|Documents       |The page or report is listed as **Documents** under the **Reports and Analysis** category.|
|History         |The page or report is listed as **Archive** under the **Reports and Analysis** category.|
|Administration  |The page or report is listed as **Administration** under the **Pages and Tasks** category.|

## Remarks

If the **UsageCategory** is set to **None**, or if you do not specify **UsageCategory**, the page or report will not show up when you use the search functionality. 

## Syntax

```
UsageCategory = ReportsAndAnalysis;  
```

## Dependent Properties
The [AccessByPermission property](devenv-accessbypermission-property.md) and [ApplicationArea Property](devenv-applicationarea-property.md) are optional properties, which can be applied to set restrictions on an object accessibility, when you add the **UsageCategory** property. 

## See Also
[Properties](devenv-properties.md)   
[Page Object](../devenv-page-object.md)  
[Report Object](../devenv-report-object.md)  
