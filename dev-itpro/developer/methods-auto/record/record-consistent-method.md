---
title: "Record.Consistent(Boolean) Method"
description: "Marks a table as being consistent or inconsistent."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Record.Consistent(Boolean) Method
> **Version**: _Available or changed with runtime version 1.0._

Marks a table as being consistent or inconsistent.


## Syntax
```AL
 Record.Consistent(Consistent: Boolean)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Consistent*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The mark to be set on the table. If this parameter is true, the table is marked as consistent. If this parameter is false, the table is marked as inconsistent.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)