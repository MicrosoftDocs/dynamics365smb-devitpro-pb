---
title: "Report.UseRequestPage Method"
ms.author: solsen
ms.custom: na
ms.date: 05/19/2021
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
# Report.UseRequestPage Method
> **Version**: _Available from runtime version 1.0._

Gets or sets whether a request page is presented to the user.


## Syntax
```
[IsUseRequestPage := ]  Report.UseRequestPage([SetUseRequestPage: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Report*
&emsp;Type: [Report](report-data-type.md)
An instance of the [Report](report-data-type.md) data type.

*SetUseRequestPage*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if a request page will be presented to the user, otherwise **false**.  


## Return Value
*IsUseRequestPage*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if a request page is presented to the user, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)