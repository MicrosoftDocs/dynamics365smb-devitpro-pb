---
title: "HASTABLECONNECTION Function (Database)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f1bd40cf-c2ac-4843-b832-1454c6558da3
caps.latest.revision: 3
---
# HASTABLECONNECTION Function (Database)
Verifies if a connection to an external database exists based on the specified name.  
  
## Syntax  
  
```  
  
Ok := HASCONNECTIONTYPE(ConnectionType, Name)  
```  
  
#### Parameters  
 *ConnectionType*  
 Type: TableConnectionType  
  
 Specifies the type of table connection as defined in the **TableType** property.  
  
 *Name*  
 Type: Text  
  
 The name of the external table connection. You must already have registered a table connection with this name.  
  
## Return Value  
 Type: Boolean  
  
 **true** if a table connection of the specified name exists; otherwise **false**.  
  
## See Also  
 [TableType Property](TableType-Property.md)   
 [TableConnectionType Data Type](TableConnectionType-Data-Type.md)   
 [GETDEFAULTTABLECONNECTION Function \(Database\)](GETDEFAULTTABLECONNECTION-Function--Database-.md)   
 [REGISTERTABLECONNECTION Function \(Database\)](REGISTERTABLECONNECTION-Function--Database-.md)   
 [UNREGISTERTABLECONNECTION Function \(Database\)](UNREGISTERTABLECONNECTION-Function--Database-.md)   
 [External Tables](External-Tables.md)