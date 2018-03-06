---
title: "HASTABLECONNECTION Method (Database)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f1bd40cf-c2ac-4843-b832-1454c6558da3
caps.latest.revision: 3
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# HASTABLECONNECTION Method (Database)
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
 [TableType Property](../properties/devenv-TableType-Property.md)   
 [TableConnectionType Data Type](../datatypes/devenv-TableConnectionType-Data-Type.md)   
 [GETDEFAULTTABLECONNECTION Method \(Database\)](devenv-GETDEFAULTTABLECONNECTION-Method-Database.md)   
 [REGISTERTABLECONNECTION Method \(Database\)](devenv-REGISTERTABLECONNECTION-Method-Database.md)   
 [UNREGISTERTABLECONNECTION Method \(Database\)](devenv-UNREGISTERTABLECONNECTION-Method-Database.md)   
 <!--Links [External Tables](External-Tables.md)-->