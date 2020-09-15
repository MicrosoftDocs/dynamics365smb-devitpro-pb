---
title: "Database.SetDefaultTableConnection Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Database.SetDefaultTableConnection Method
Establishes a connection to an external database based on a previously registered connection of the specified type.


## Syntax
```
 Database.SetDefaultTableConnection(Type: TableConnectionType, Name: String [, Scoped: Boolean])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Type*  
&emsp;Type: [TableConnectionType](../tableconnectiontype/tableconnectiontype-option.md)  
The type of table connection as defined in the TableType property.
        
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the external table connection. You must already have registered a table connection with this name.
        
*Scoped*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If true, when the method ends where you have used SETDEFAULTTABLECONNECTION, the default table connection returns to the value it had before. Use the Scope parameter when you want to use a specific table connection for a specific task and then return to the normal configuration.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)