---
title: "UsageCategory Property"
description: "Description of how you use AL to add pages and reports to Search in the client using the UsageCategory property."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 11/23/2017
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
AL provides navigational support for pages and reports in the client. You enable a page or report to be available through Search in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] using the **UsageCategory** property. For more information about the Search functionality in AL, see [Adding Pages and Reports to Search](../devenv-al-menusuite-functionality.md)

## Property Values
The values for the UsageCategory property are listed below: 

- None
- Lists
- Tasks
- ReportsAndAnalysis
- Documents
- History
- Administration

## Remarks

If the **UsageCategory** is set to **None**, or if you do not specify **UsageCategory**, the page or report will not show up when you use the Search functionality. 

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
