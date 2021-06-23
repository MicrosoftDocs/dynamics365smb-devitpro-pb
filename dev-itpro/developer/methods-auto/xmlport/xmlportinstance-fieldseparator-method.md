---
title: "Xmlport.FieldSeparator Method"
description: "Gets and sets the FieldSeparator used when running, importing or exporting the XmlPort."
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
# Xmlport.FieldSeparator Method
> **Version**: _Available or changed with runtime version 1.0._

Gets and sets the FieldSeparator used when running, importing or exporting the XmlPort.


## Syntax
```AL
[Separator := ]  Xmlport.FieldSeparator([Separator: String])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Xmlport*  
&emsp;Type: [Xmlport](xmlport-data-type.md)  
An instance of the [Xmlport](xmlport-data-type.md) data type.  

*[Optional] Separator*  
&emsp;Type: [String](../string/string-data-type.md)  
The new value of the FieldSeparator.  


## Return Value
*[Optional] Separator*  
&emsp;Type: [String](../string/string-data-type.md)  
The FieldSeparator used when running, importing or exporting the XmlPort.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[FieldSeparator Property](../../properties/devenv-fieldseparator-property.md)  
[Xmlport Data Type](xmlport-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)