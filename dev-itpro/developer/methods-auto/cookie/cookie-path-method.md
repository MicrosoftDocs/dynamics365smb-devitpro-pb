---
title: "Cookie.Path() Method"
description: "The path of the cookie."
ms.author: solsen
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Cookie.Path() Method
> **Version**: _Available or changed with runtime version 13.0._

The path of the cookie. It indicates the path that must exist in the request URL to send the cookie.


## Syntax
```AL
Path :=   Cookie.Path()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Cookie*  
&emsp;Type: [Cookie](cookie-data-type.md)  
An instance of the [Cookie](cookie-data-type.md) data type.  

## Return Value
*Path*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path of the cookie.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Cookie Data Type](cookie-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)