---
title: "Record.Reset Method"
ms.author: solsen
ms.custom: na
ms.date: 12/02/2020
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
# Record.Reset Method
> **Version**: _Available from runtime version 1.0._

Removes all filters, including any special filters set by MarkedOnly, changes fields select for loading back to all, and changes the current key to the primary key. Also removes any marks on the record and clears any AL variables defined on its table definition.


## Syntax
```
 Record.Reset()
```

## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)