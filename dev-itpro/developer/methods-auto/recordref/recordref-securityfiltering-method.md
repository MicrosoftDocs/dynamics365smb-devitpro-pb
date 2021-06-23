---
title: "RecordRef.SecurityFiltering Method"
description: "Gets or sets how security filters are applied to the RecordRef."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# RecordRef.SecurityFiltering Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets how security filters are applied to the RecordRef.


## Syntax
```AL
[SecurityFiltering := ]  RecordRef.SecurityFiltering([NewSecurityFiltering: SecurityFilter])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*[Optional] NewSecurityFiltering*  
&emsp;Type: [SecurityFilter](../securityfilter/securityfilter-option.md)  
The new security filter for the RecordRef.  


## Return Value
*[Optional] SecurityFiltering*  
&emsp;Type: [SecurityFilter](../securityfilter/securityfilter-option.md)  
The security filter applied to the RecordRef.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)