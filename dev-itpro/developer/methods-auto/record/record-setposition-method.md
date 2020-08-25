---
title: "SetPosition Method"
ms.author: solsen
ms.custom: na
ms.date: 06/18/2020
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
# SetPosition Method
Sets the fields in a primary key on a record to the values specified in the supplied string. The remaining fields are not changed.


## Syntax
```
 Record.SetPosition(String: String)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string that is used to set the primary key. This string contains the primary key value to set.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)