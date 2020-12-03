---
title: "Xmlport.Export Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Xmlport.Export Method
> **Version**: _Available from runtime version 1.0._

Creates an XML data stream (XML document) and sends it to a chosen destination.


## Syntax
```
[Ok := ]  Xmlport.Export()
```

## Parameters
*Xmlport*
&emsp;Type: [Xmlport](xmlport-data-type.md)
An instance of the [Xmlport](xmlport-data-type.md) data type.

## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the serialization of the XML document was successful, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Xmlport Data Type](xmlport-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)