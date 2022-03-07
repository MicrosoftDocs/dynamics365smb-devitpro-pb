---
title: "FieldRef.FieldError([String]) Method"
description: "Stops the execution of the code, causing a run-time error, and creates an error message for a field."
ms.author: solsen
ms.custom: na
ms.date: 10/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.FieldError([String]) Method
> **Version**: _Available or changed with runtime version 1.0._

Stops the execution of the code, causing a run-time error, and creates an error message for a field.


## Syntax
```AL
 FieldRef.FieldError([Text: String])
```
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

*[Optional] Text*  
&emsp;Type: [String](/dynamics365/business-central/dev-itpro/developer/methods-auto/text/text-data-type)  
Use this optional parameter to include the text of the error message. If this parameter is not present, default text will be used.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[FieldRef Data Type](fieldref-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)