---
title: "ReportHandler Attribute"
description: "Specifies that the method is a ReportHandler method, which handles specific reports."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# ReportHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a ReportHandler method, which handles specific reports.


## Applies To

- Method

> [!NOTE]
> The ReportHandler attribute can only be set inside codeunits with the **SubType property** set to Test.

## Syntax

```
[ReportHandler]
procedure ReportHandler(var Report: Report)
```

### Parameters
*Report*  
&emsp;Type: [Report](../methods-auto/report/report-data-type.md)  
A specific report.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  