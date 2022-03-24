---
title: "RequestPage.ObjectId([Boolean]) Method"
description: "Returns a string in the Page xxx format, where xxx is the caption or ID of the application object."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RequestPage.ObjectId([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Returns a string in the "Page xxx" format, where xxx is the caption or ID of the application object.


## Syntax
```AL
String :=   RequestPage.ObjectId([UseNames: Boolean])
```
## Parameters
*RequestPage*  
&emsp;Type: [RequestPage](requestpage-data-type.md)  
An instance of the [RequestPage](requestpage-data-type.md) data type.  

*[Optional] UseNames*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** returns the page caption, if there is one; otherwise, it returns the page name. **false** returns the page ID as text.  


## Return Value
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text of the object


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RequestPage Data Type](requestpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)