---
title: "SETDEFAULTTABLECONNECTION Method (Database)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 82001e76-9705-4ad8-904c-1610a6c8ee53
caps.latest.revision: 5
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETDEFAULTTABLECONNECTION Method (Database)
Establishes a connection to an external database based on a previously registered connection of the specified type.  
  
## Syntax  
  
```  
SETDEFAULTCONNECTIONTYPE(Type, Name, Scope)  
```  
  
#### Parameters  
 *Type*  
 Type: TableConnectionType  
  
 The type of table connection as defined in the **TableType** property.  
  
 *Name*  
 Type: Text  
  
 The name of the external table connection. You must already have registered a table connection with this name.  
  
 *Scope*  
 Type: Boolean  
  
 If **true**, when the method ends where you have used SETDEFAULTTABLECONNECTION, the default table connection returns to the value it had before. Use the *Scope* parameter when you want to use a specific table connection for a specific task and then return to the normal configuration.  
  
## See Also  
 [TableType Property](../properties/devenv-TableType-Property.md)   
 [TableConnectionType Data Type](../datatypes/devenv-TableConnectionType-Data-Type.md)   
 [GETDEFAULTTABLECONNECTION Method \(Database\)](devenv-GETDEFAULTTABLECONNECTION-Method-Database.md)   
 [REGISTERTABLECONNECTION Method \(Database\)](devenv-REGISTERTABLECONNECTION-Method-Database.md)   
 [UNREGISTERTABLECONNECTION Method \(Database\)](devenv-UNREGISTERTABLECONNECTION-Method-Database.md)   
 <!--Links [External Tables](External-Tables.md)-->