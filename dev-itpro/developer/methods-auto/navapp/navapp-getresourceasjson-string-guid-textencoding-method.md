---
title: "NavApp.GetResourceAsJson(Text, Guid [, TextEncoding]) Method"
description: "Retrieves the specified public resource from the given app as a JsonObject."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.GetResourceAsJson(Text, Guid [, TextEncoding]) Method
> **Version**: _Available or changed with runtime version 18.0._

Retrieves the specified public resource from the given app as a JsonObject.


## Syntax
```AL
ResourceValue :=   NavApp.GetResourceAsJson(ResourceName: Text, AppId: Guid [, Encoding: TextEncoding])
```
## Parameters
*ResourceName*  
&emsp;Type: [Text](../text/text-data-type.md)  
Name of the public resource to retrieve.  

*AppId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The ID of the app from which to retrieve the public resource.  

*[Optional] Encoding*  
&emsp;Type: [TextEncoding](../textencoding/textencoding-option.md)  
The encoding that will be used by the stream. The default encoding is MSDos.  


## Return Value
*ResourceValue*  
&emsp;Type: [JsonObject](../jsonobject/jsonobject-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[NavApp data type](navapp-data-type.md)  
[Adding and accessing resources in Business Central extensions](../../devenv-app-resources.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)