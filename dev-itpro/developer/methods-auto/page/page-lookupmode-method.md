---
title: "Page.LookupMode Method"
description: "Gets or sets the default lookup mode for the page."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# Page.LookupMode Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the default lookup mode for the page.


## Syntax
```
[LookupMode := ]  Page.LookupMode([NewLookupMode: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  

*[Optional] NewLookupMode*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The new default lookup mode for the page.  


## Return Value
*[Optional] LookupMode*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The current default lookup mode for the page


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)