---
title: "Object Specifications and Limitations"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ec326a0a-bff9-4761-8296-ae42bcf393c9
caps.latest.revision: 14
---
# Object Specifications and Limitations
This topic describes the specifications and limitations for the database and application objects.  
  
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
|Maximum record size|8060 bytes|  
|Maximum number of fields in a record|500|  
|Range for field numbers|1 – 999,999,999|  
|Maximum number of keys for a table|40|  
|Maximum size of a [!INCLUDE[navnow](includes/navnow_md.md)] key|900 bytes|  
|Maximum number of distinct fields per key|16|  
|Maximum size of an (non-key) index|1700 bytes|  
|Maximum number of SumIndexFields per key|20|  
|Maximum number of characters in a text or code field|250|  
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
  
 <sup>1</sup>All application objects are identified by an ID number. There are restrictions, however, on the numbers you can use when you create your own application objects. Review your Partner License Agreement for more information.  
  
## See Also  
 [Objects](Objects.md)   
 [Field Data Types](Field-Data-Types.md)   
 [Maximum Capacity Specifications for SQL Server](https://go.microsoft.com/fwlink/?LinkId=302003)
