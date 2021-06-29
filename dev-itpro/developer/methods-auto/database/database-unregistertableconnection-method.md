---
title: "Database.UnregisterTableConnection Method"
description: "Unregisters a table connection to an external database."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Database.UnregisterTableConnection Method
> **Version**: _Available or changed with runtime version 1.0._

Unregisters a table connection to an external database.


## Syntax
```
 Database.UnregisterTableConnection(Type: TableConnectionType, Name: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Type*  
&emsp;Type: [TableConnectionType](../tableconnectiontype/tableconnectiontype-option.md)  
Specifies the type of table connection as defined in the TableType property. If the table is of type ExternalSQL, UNREGISTERTABLECONNECTION rolls back the current transaction.
        
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the name of the connection in your code, or the name of the primary key field on the table.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)