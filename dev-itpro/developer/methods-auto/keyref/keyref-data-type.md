---
title: "KeyRef Data Type"
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
# KeyRef Data Type
> **Version**: _Available from runtime version 1.0._

Identifies a key in a table and the fields in this key.



The following methods are available on instances of the KeyRef data type.

|Method name|Description|
|-----------|-----------|
|[FieldCount()](keyref-fieldcount-method.md)|Gets the number of fields that have been defined in a key. Returns an error if no key is selected.|
|[FieldIndex(Integer)](keyref-fieldindex-method.md)|Gets the FieldRef of the field that has this index in the key referred to by the KeyRef variable. Returns an error if no key is selected.|
|[Record()](keyref-record-method.md)|Returns a RecordRef for the current record referred to by the key.|
|[Active()](keyref-active-method.md)|Indicates whether the key is enabled.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  