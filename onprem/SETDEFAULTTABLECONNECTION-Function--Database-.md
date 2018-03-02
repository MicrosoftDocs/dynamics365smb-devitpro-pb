---
title: "SETDEFAULTTABLECONNECTION Function (Database)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 82001e76-9705-4ad8-904c-1610a6c8ee53
caps.latest.revision: 5
---
# SETDEFAULTTABLECONNECTION Function (Database)
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
  
 If **true**, when the function ends where you have used SETDEFAULTTABLECONNECTION, the default table connection returns to the value it had before. Use the *Scope* parameter when you want to use a specific table connection for a specific task and then return to the normal configuration.  
  
## See Also  
 [TableType Property](TableType-Property.md)   
 [TableConnectionType Data Type](TableConnectionType-Data-Type.md)   
 [GETDEFAULTTABLECONNECTION Function \(Database\)](GETDEFAULTTABLECONNECTION-Function--Database-.md)   
 [REGISTERTABLECONNECTION Function \(Database\)](REGISTERTABLECONNECTION-Function--Database-.md)   
 [UNREGISTERTABLECONNECTION Function \(Database\)](UNREGISTERTABLECONNECTION-Function--Database-.md)   
 [External Tables](External-Tables.md)