---
title: "UNREGISTERTABLECONNECTION Method (Database)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 4f0f85c5-ca77-4dc9-bf83-67ab2669dbc9
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# UNREGISTERTABLECONNECTION Method (Database)
Unregisters a table connection between [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] and an external database.  
  
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
 <!--Links [External Tables](External-Tables.md)-->   
 [TableConnectionType Data Type](../datatypes/devenv-TableConnectionType-Data-Type.md)   
 [REGISTERTABLECONNECTION Method \(Database\)](devenv-REGISTERTABLECONNECTION-Method-Database.md)