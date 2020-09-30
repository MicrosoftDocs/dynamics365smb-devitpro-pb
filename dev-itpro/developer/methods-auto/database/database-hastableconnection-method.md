---
title: "Database.HasTableConnection Method"
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
# Database.HasTableConnection Method
Verifies if a connection to an external database exists based on the specified name.


## Syntax
```
Ok :=   Database.HasTableConnection(Type: TableConnectionType, Name: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Type*  
&emsp;Type: [TableConnectionType](../tableconnectiontype/tableconnectiontype-option.md)  
Specifies the type of table connection as defined in the TableType property.
        
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the external table connection. You must already have registered a table connection with this name.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if a connection to an external database exists for the specified name, otherwise **false**.
        


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)