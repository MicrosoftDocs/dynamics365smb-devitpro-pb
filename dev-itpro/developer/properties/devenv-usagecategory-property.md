---
title: "UsageCategory Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
> **Version**: _Available or changed with runtime version 1.0._

Sets the department column for a searched page or report in the Web client.

## Applies to
-   Page
-   Report

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**None**|The page or report is not included in a search.|
|**Lists**|The page or report is listed as **Lists** under the **Pages and Tasks** category.|
|**Tasks**|The page or report is listed as **Tasks** under the **Pages and Tasks** category.|
|**ReportsAndAnalysis**|The page or report is listed as **Reports and Analysis** under the **Reports and Analysis** category.|
|**Documents**|The page or report is listed as **Documents** under the **Reports and Analysis** category.|
|**History**|The page or report is listed as **Archive** under the **Reports and Analysis** category.|
|**Administration**|The page or report is listed as **Administration** under the **Pages and Tasks** category.|

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
