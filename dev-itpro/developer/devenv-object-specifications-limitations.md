---
title: "Object Specifications and Limitations"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Object Specifications and Limitations

This article describes the specifications and limitations for the database and application objects.  
  
## Specifications for the Database
 
The following characteristics are based on maximum capacity specifications for SQL Server 2017. Please visit the link below to see specifications for previous versions of SQL Server.

|Feature|Characteristic|  
|-------------|--------------------|  
|Maximum number of physical disk files|32,767|  
|Database file size|524,272 terabytes|  
|Maximum number of objects in a database|2,147,483,647|  
|Maximum number of characters in application object names|30|  
|Maximum number of characters in a Database Authentication password|80|  

## Specifications for Tables
  
The following characteristics are based on maximum capacity specifications for SQL Server 2017. Please visit the link below to see specifications for previous versions of SQL Server.

|Feature|Characteristic|  
|-------------|--------------------|  
|Range for table object ID numbers|1 – 999,999,999 <sup>1</sup>|  
|Maximum number of characters in a table name|30|  
|Maximum table size|Depends on available storage|  
|Maximum number of records in a table|Depends on available storage|  
|Maximum record size|8060 bytes<sup>2</sup>|  
|Maximum number of fields in a record|500|  
|Range for field numbers|1 – 999,999,999|  
|Maximum number of keys for a table|40|  
|Maximum size of a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] key|900 bytes|  
|Maximum number of distinct fields per key|16|  
|Maximum size of an (non-key) index|1700 bytes|  
|Maximum number of SumIndexFields per key|20|  
|Maximum number of characters in a text or code field|2048|  
|Maximum size of a BLOB field|2 GB|  
|Maximum number of characters in a field name|30|  
  
## Specifications for Pages and Reports  
  
|Feature|Characteristic|  
|-------------|--------------------|  
|Range for page or report object ID numbers|1 – 999,999,999 <sup>1</sup>|  
|Maximum number of characters in a caption|1024|  
|Maximum bitmap size in bitmap property|32500 bytes|  
  
## Specifications for Codeunits  
  
|Feature|Characteristic|  
|-------------|--------------------|  
|Range for table object ID numbers|1 – 999,999,999 <sup>1</sup>|  
|Maximum number of characters in variable names|30|  
|Maximum number of dimensions in array variables|10|  
|Maximum number of elements in an array variable|1,000,000|  
|Maximum physical size of a codeunit|2 GB|  
|Lower bound of index in an array|1|  

  
## Specifications for variables
 
|Feature|Characteristic|  
|-------------|--------------------|  
|Maximum number of characters in text variables|2048<sup>3</sup>|   
|Maximum number of characters in code variables|2048|  

## Specifications for text constants  
  
|Feature|Characteristic|  
|-------------|--------------------|  
|Maximum number of characters|2048|   
  
<sup>1</sup>All application objects are identified by an ID number. There are restrictions, however, on the numbers you can use when you create your own application objects. Review your Partner License Agreement for more information. 

<sup>2</sup>Each variable-length text field accounts for 26 bytes in the record. 

<sup>3</sup> If no length is specified for text variables, the length is unlimited.  
  
## See Also  
 [Field Data Types](./methods-auto/library.md)   
 [Maximum Capacity Specifications for SQL Server](/sql/sql-server/maximum-capacity-specifications-for-sql-server)