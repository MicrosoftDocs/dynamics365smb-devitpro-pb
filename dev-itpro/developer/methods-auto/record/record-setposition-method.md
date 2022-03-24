---
title: "Record.SetPosition(String) Method"
description: "Sets the fields in a primary key on a record to the values specified in the supplied string."
ms.author: solsen
ms.custom: na
ms.date: 03/17/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.SetPosition(String) Method
> **Version**: _Available or changed with runtime version 1.0._

Sets the fields in a primary key on a record to the values specified in the supplied string. The remaining fields are not changed.


## Syntax
```AL
 Record.SetPosition(String: String)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*String*  
&emsp;Type: [String](../text/text-data-type.md)  
The string that is used to set the primary key. This string contains the primary key value to set.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)