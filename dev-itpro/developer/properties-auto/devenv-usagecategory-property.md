---
title: "UsageCategory Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# UsageCategory Property
Sets the department column for a searched page or report in the Web client.

## Applies to
-   Page
-   Report

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|None|TODO:Add documentation|
|Lists|TODO:Add documentation|
|Tasks|TODO:Add documentation|
|ReportsAndAnalysis|TODO:Add documentation|
|Documents|TODO:Add documentation|
|History|TODO:Add documentation|
|Administration|TODO:Add documentation|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If the **UsageCategory** is set to **None**, or if you do not specify **UsageCategory**:

- The page or report will not show up when you use the search functionality.  
- Users will not be able to bookmark a link to the page or report object from the user interface.

## Syntax

```AL
UsageCategory = ReportsAndAnalysis;  
```

## Dependent Properties

The [AccessByPermission property](devenv-accessbypermission-property.md) and [ApplicationArea Property](devenv-applicationarea-property.md) are optional properties, which can be applied to set restrictions on an object accessibility, when you add the **UsageCategory** property. 

## See Also

[Adding Pages and Reports to Tell me](../devenv-al-menusuite-functionality.md)  
[Properties](devenv-properties.md)  
[Page Object](../devenv-page-object.md)  
[Report Object](../devenv-report-object.md)  
