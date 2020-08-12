---
title: "SetPermissionFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 08/12/2020
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
# SetPermissionFilter Method
Applies the user's security filter to the referenced record. The security filter is combined with any other filters that are placed on the record with SetFilter or SetRange. The combined filter will not include any records outside the range of the security filter and this will prevent a runtime permission error from occuring when the record is read. If the permission filter is not set, an error can occur if you attempt to read a record that is outside the range of the user's security filter.


## Syntax
```
 RecordRef.SetPermissionFilter()
```

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)