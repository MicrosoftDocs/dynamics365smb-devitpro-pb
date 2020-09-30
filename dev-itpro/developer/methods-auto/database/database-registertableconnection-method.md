---
title: "Database.RegisterTableConnection Method"
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
# Database.RegisterTableConnection Method
Registers a table connection to an external database.


## Syntax
```
 Database.RegisterTableConnection(Type: TableConnectionType, Name: String, Connection: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Type*  
&emsp;Type: [TableConnectionType](../tableconnectiontype/tableconnectiontype-option.md)  
Specifies the type of table connection as defined in the TableType property.
        
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the name of the connection in your code, or the name of the primary key field on the table.
        
*Connection*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the connection to the external database.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)