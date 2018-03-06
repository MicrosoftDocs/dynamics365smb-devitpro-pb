---
title: "REGISTERTABLECONNECTION Function (Database)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 97ff7045-1350-4c96-8dd8-e9a6e1f9de7d
caps.latest.revision: 4
---
# REGISTERTABLECONNECTION Function (Database)
Registers a table connection between [!INCLUDE[navnow](includes/navnow_md.md)] and an external database.  
  
## Syntax  
  
```  
REGISTERTABLECONNECTION(Type, Name, Connection)  
```  
  
#### Parameters  
 *Type*  
 Type: TableConnectionType  
  
 Specifies the type of table connection as defined in the **TableType** property.  
  
 *Name*  
 Type: Text  
  
 Specifies the name of the connection in your code, or the name of the primary key field on the table.  
  
 *Connection*  
 Type: Text  
  
 Specifies the connection to the external database, such as `'Data Source=ProdServer1;Initial Catalog=ProdDb1;User ID=sqladmin;Password=p@ssword')`. Alternatively, define the connection in a separate function.  
  
## See Also  
 [External Tables](External-Tables.md)   
 [TableConnectionType Data Type](TableConnectionType-Data-Type.md)   
 [UNREGISTERTABLECONNECTION Function \(Database\)](UNREGISTERTABLECONNECTION-Function--Database-.md)