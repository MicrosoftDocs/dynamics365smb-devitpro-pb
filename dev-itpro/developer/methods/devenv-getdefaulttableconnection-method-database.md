---
title: "GETDEFAULTTABLECONNECTION Method (Database)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 28b41eb4-c57d-498f-afdb-460002850de9
caps.latest.revision: 4
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETDEFAULTTABLECONNECTION Method (Database)
Gets the default table connection based on the specified connection type. You must already have registered a table connection of this type.  
  
## Syntax  
  
```  
Name:= GETDEFAULTCONNECTIONTYPE(Type)  
```  
  
#### Parameters  
 *Type*  
 Type: TableConnectionType  
  
 The type of table connection as defined in the **TableType** property.  
  
## See Also  
 [TableType Property](../properties/devenv-TableType-Property.md)   
 [TableConnectionType Data Type](../datatypes/devenv-TableConnectionType-Data-Type.md)   
 [REGISTERTABLECONNECTION Method \(Database\)](devenv-REGISTERTABLECONNECTION-Method-Database.md)   
 [SETDEFAULTTABLECONNECTION Method \(Database\)](devenv-SETDEFAULTTABLECONNECTION-Method-Database.md)   
 <!--Links [External Tables](External-Tables.md)-->