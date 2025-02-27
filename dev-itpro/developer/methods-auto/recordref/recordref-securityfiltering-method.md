---
title: "RecordRef.SecurityFiltering([SecurityFilter]) Method"
description: "Gets or sets how security filters are applied to the RecordRef."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.SecurityFiltering([SecurityFilter]) Method
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
## Related information
[RecordRef Data Type](recordref-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)