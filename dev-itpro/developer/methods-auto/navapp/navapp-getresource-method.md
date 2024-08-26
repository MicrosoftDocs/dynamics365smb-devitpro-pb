---
title: "NavApp.GetResource(Text, var InStream) Method"
description: "Loads default, or starting, table data into the specified table of an extension during installation."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.GetResource(Text, var InStream) Method
> **Version**: _Available or changed with runtime version 14.0._

Loads default, or starting, table data into the specified table of an extension during installation.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
 NavApp.GetResource(ResourceName: Text, var ResourceStream: InStream)
```
## Parameters
*ResourceName*  
&emsp;Type: [Text](../text/text-data-type.md)  
Name of the resource to retrieve  

*ResourceStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
Name of the resource to retrieve  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NavApp data type](navapp-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)