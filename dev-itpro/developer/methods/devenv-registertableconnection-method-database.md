---
title: "REGISTERTABLECONNECTION Method (Database)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 97ff7045-1350-4c96-8dd8-e9a6e1f9de7d
caps.latest.revision: 4
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# REGISTERTABLECONNECTION Method (Database)
Registers a table connection between [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] and an external database.  
  
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
  
 Specifies the connection to the external database, such as `'Data Source=ProdServer1;Initial Catalog=ProdDb1;User ID=sqladmin;Password=p@ssword')`. Alternatively, define the connection in a separate method.  
  
## See Also  
 <!--Links [External Tables](External-Tables.md)-->   
 [TableConnectionType Data Type](../datatypes/devenv-TableConnectionType-Data-Type.md)   
 [UNREGISTERTABLECONNECTION Method \(Database\)](devenv-UNREGISTERTABLECONNECTION-Method-Database.md)