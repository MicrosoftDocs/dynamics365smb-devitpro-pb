---
title: "UNREGISTERTABLECONNECTION Function (Database)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4f0f85c5-ca77-4dc9-bf83-67ab2669dbc9
caps.latest.revision: 4
---
# UNREGISTERTABLECONNECTION Function (Database)
Unregisters a table connection between [!INCLUDE[navnow](includes/navnow_md.md)] and an external database.  
  
## Syntax  
  
```  
UNREGISTERTABLECONNECTION(Type, Name)  
```  
  
#### Parameters  
 *Type*  
 Type: TableConnectionType  
  
 Specifies the type of table connection as defined in the **TableType** property. If the table is of type ExternalSQL, UNREGISTERTABLECONNECTION rolls back the current transaction.  
  
 *Name*  
 Type: Text  
  
 Specifies the name of the connection in your code, or the name of the primary key field on the table.  
  
## See Also  
 [External Tables](External-Tables.md)   
 [TableConnectionType Data Type](TableConnectionType-Data-Type.md)   
 [REGISTERTABLECONNECTION Function \(Database\)](REGISTERTABLECONNECTION-Function--Database-.md)