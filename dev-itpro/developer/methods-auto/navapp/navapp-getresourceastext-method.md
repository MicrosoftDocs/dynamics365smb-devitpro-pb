---
title: "NavApp.GetResourceAsText(Text [, TextEncoding]) Method"
description: "Retrieves the specified resource as Text"
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.GetResourceAsText(Text [, TextEncoding]) Method
> **Version**: _Available or changed with runtime version 14.0._

Retrieves the specified resource as Text


## Syntax
```AL
ResourceValue :=   NavApp.GetResourceAsText(ResourceName: Text [, Encoding: TextEncoding])
```
## Parameters
*ResourceName*  
&emsp;Type: [Text](../text/text-data-type.md)  
Name of the resource to retrieve  

*[Optional] Encoding*  
&emsp;Type: [TextEncoding](../textencoding/textencoding-option.md)  
The encoding that will be used by the stream. The default encoding is MSDos.  


## Return Value
*ResourceValue*  
&emsp;Type: [Text](../text/text-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[NavApp data type](navapp-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)