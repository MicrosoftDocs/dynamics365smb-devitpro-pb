---
title: "Record.Reset() Method"
description: "Removes all filters, including any special filters set by MarkedOnly, changes fields select for loading back to all, sets the read isolation level to the default value, and changes the current key to the primary key."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.Reset() Method
> **Version**: _Available or changed with runtime version 1.0._

Removes all filters, including any special filters set by MarkedOnly, changes fields select for loading back to all, sets the read isolation level to the default value, and changes the current key to the primary key. Also removes any marks on the record and clears any AL variables defined on its table definition.


## Syntax
```AL
 Record.Reset()
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)