---
title: "Cookie.Secure() Method"
description: "True if the cookie is Secure, false otherwise."
ms.author: solsen
ms.date: 08/15/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Cookie.Secure() Method
> **Version**: _Available or changed with runtime version 13.0._

True if the cookie is Secure, false otherwise. It indicates that the cookie is sent only when a request is made with the https.


## Syntax
```AL
Secure :=   Cookie.Secure()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Cookie*  
&emsp;Type: [Cookie](cookie-data-type.md)  
An instance of the [Cookie](cookie-data-type.md) data type.  

## Return Value
*Secure*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
True if the cookie is Secure, false otherwise.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Cookie Data Type](cookie-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)