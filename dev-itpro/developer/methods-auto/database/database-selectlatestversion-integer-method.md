---
title: "Database.SelectLatestVersion(Integer) Method"
description: "Ensures that the table's latest version is used, ignoring any cached values older than the method's call time."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database.SelectLatestVersion(Integer) Method
> **Version**: _Available or changed with runtime version 14.0._

Ensures that the table's latest version is used, ignoring any cached values older than the method's call time.


## Syntax
```AL
 Database.SelectLatestVersion(Table: Integer)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Table*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the table.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database data type](database-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)