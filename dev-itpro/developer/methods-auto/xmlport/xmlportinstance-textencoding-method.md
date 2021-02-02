---
title: "Xmlport.TextEncoding Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Xmlport.TextEncoding Method
> **Version**: _Available from runtime version 1.0._

Gets and sets the TextEncoding used when running, importing or exporting the XmlPort.


## Syntax
```
[Encoding := ]  Xmlport.TextEncoding([Encoding: TextEncoding])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Xmlport*
&emsp;Type: [Xmlport](xmlport-data-type.md)
An instance of the [Xmlport](xmlport-data-type.md) data type.

*Encoding*  
&emsp;Type: [TextEncoding](../textencoding/textencoding-option.md)  
The new value of the TextEncoding.  


## Return Value
*Encoding*
&emsp;Type: [TextEncoding](../textencoding/textencoding-option.md)
The TextEncoding used when running, importing or exporting the XmlPort.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Xmlport Data Type](xmlport-data-type.md)  
[TextEncoding Property \(XMLports\)](../../properties/devenv-textencoding-xmlports-property.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)