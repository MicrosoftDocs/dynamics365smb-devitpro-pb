---
title: "DefaultLayout Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# DefaultLayout Property
> **Version**: _Available from runtime version 1.0._

Specifies whether the report uses the built-in RDLC or Word report layout by default.

## Applies to
-   Report

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**RDLC**|Specifies the built-in RDL layout as the default layout.|
|**Word**|Specifies the built-in Word layout as the default layout.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
DefaultLayout = Word;
``` 
  
## Remarks

A report object can include a built-in layout of either an RDL type, Word type, or both. When you set the property to a type, then that layout type is used by default to view, save and print a report. Users can change a report to use another layout from the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] client.  


## See Also

[Report Object](../devenv-report-object.md)  
[Creating a Word Layout Report](../devenv-howto-report-layout.md)  
[Creating an RDL Layout Report](../devenv-howto-rdl-report-layout.md)  
