---
title: "External Tables"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 39b2abf7-8fbb-4e8c-b2d8-802b48959416
caps.latest.revision: 4
---
# External Tables
You can create tables in [!INCLUDE[navnow](includes/navnow_md.md)] that represent tables in external products, such as [!INCLUDE[crm](includes/crm_md.md)] and SQL Server. This is a more dynamic table relationship than creating table definitions from SQL Server objects using linked objects, because the connection to the external table can be changed at runtime. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)] you can define two types of external tables: [!INCLUDE[crm](includes/crm_md.md)] tables and **SQL Server** tables. You create an external table by specifying the type of in the TableType property.  
  
> [!IMPORTANT]  
>  We advise against creating tables of type CRM manually. Instead, use the integration mapping functionality. For more information, see [Integration Concepts and Terminology](Dynamics-CRM-Integration-Concepts-and-Terminology.md).  
  
## Creating and Using External Tables  
 [!INCLUDE[navnow](includes/navnow_md.md)] commits on all connections at the same time, such as at the same time for the tenant database connection and the application database connection in multitenant deployments. When an external connection is registered, it is joined into this so that any errors will rollback on all connections in use.  
  
 To use an external table in your code, you must first register one or more connections to the external database as shown in the following code example.  
  
```  
REGISTERTABLECONNECTION(TABLECONNECTIONTYPE::ExternalSQL, 'ExternalDb1', 'Data Source=ProdServer1;Initial Catalog=ProdDb1;User ID=sqladmin;Password=p@ssword');  
```  
  
 When records from external tables are instantiated, the connection is set on them. To set the current table connection, issue the following C/AL command so that different instances can use different connections.  
  
```  
SETDEFAULTTABLECONNECTION(TABLECONNECTIONTYPE::ExternalSQL, 'ExternalDb1');  
```  
  
 When done using a set of tables that are connected to a given source, issue the following command. For tables of type ExternalSQL, when **UnregisterTableConnection** is called, the current transaction will be rolled back.  
  
```  
UNREGISTERTABLECONNECTION(TABLECONNECTIONTYPE::ExternalSQL, 'ExternalDb1');  
```  
  
 To see examples of how you can use these functions, see codeunits 5330 and 5331 in the standard version of [!INCLUDE[navnow](includes/navnow_md.md)].  
  
 The actual table connection settings can also be managed using the following new [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets. In multitenant deployments, information about the connections is added to a table in the application database.  
  
|Cmdlet Name|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------------|---------------------------------------|  
|New-NAVTableConnection|Creates a connection to an external table.|  
|Remove-NAVTableConnection|Removes an established connection to an external table.|  
|Get-NAVTableConnection|Gets information about connections to external tables.|  
  
 If you know that your integration with the external product will be managed by [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets, your code must call **RegisterTableConnection** without the actual connection string as shown in the following code example.  
  
```  
REGISTERTABLECONNECTION(TABLECONNECTIONTYPE::ExternalSQL, 'ExternalDb1');  
```  
  
 In this scenario, you can write a function that generates a connection string based on the current configuration.  
  
## See Also  
 [TableType Property](TableType-Property.md)   
 [Overview of Tables](Overview-of-Tables.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)