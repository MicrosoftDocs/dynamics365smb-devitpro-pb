---
title: "AllowScheduling Property"
description: Describes the AllowScheduling Property in AL for report objects.
ms.author: jswymer
ms.custom: na
ms.date: 11/17/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AllowScheduling Property
> **Version**: _Available from runtime version 7.0._

Sets whether the report can be run in the background.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**true** if a report can be scheduled; otherwise, **false**. The default is **true**.  

## Syntax

```AL
AllowScheduling = false;
```

## Remarks

When set to **false**, the report won't support multiple previews. **false** cancels the effect of the [SaveValues](devenv-savevalues-property.md) request page property, which enables the multiple previews feature.

## See Also  

[Report Properties](devenv-report-properties.md)  
[SaveValues Property](devenv-savevalues-property.md)  