---
title: Identifiers, Data Types, and Data Formats
description: This topic describes the identifiers for SQL Server tables and columns, representation of data types, and data formats used in Microsoft Dynamics NAV.
ms.custom: na
ms.date: 10/27/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 95c4fb0a-ea08-46a0-be5d-7723381314ee
caps.latest.revision: 13
---
# Identifiers, Data Types, and Data Formats in Microsoft Dynamics NAV
This topic describes the identifiers, data types, and data formats that are used in the [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  
  
## Naming Identifiers  
 Identifiers for SQL Server tables and columns are based upon the table names and field names for the corresponding tables and fields of a [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] table definition. If you set a table’s **DataPerCompany** property to **Yes**, the SQL Server table name is prefixed by the company name. The two names are separated by the \($\) symbol. For example, the SQL Server table name for the **Customer** table of the CRONUS International Ltd. company is CRONUS International Ltd\_$Customer. If the **DataPerCompany** property of a table is set to **No**, there is no prefix.  
  
 The primary key of a [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] table is created in a SQL Server table as a primary key constraint. The name of the primary key is based on the table name with a suffix of $0, for example, CRONUS International Ltd\_$Customer$0. Any secondary keys in a [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] table that must be created and maintained in SQL Server, that is, the **MaintainSQLIndex** key property is set to **Yes,** will have SQL Server indexes created that are named after an internal key ID with a $ prefix. Examples of this are $1 and $4.  
  
 If the database maintains SQL views for language IDs, the system creates a SQL view by prefixing the SQL Server table name with the Windows language ID. For example, if you want to refer to the **Customer** table in the CRONUS International Ltd. company in German \(standard\), the SQL view is DEU$CRONUS International Ltd\_$Customer. For more information about multilanguage functionality, see [Multilanguage Development](Multilanguage-Development.md).  
  
 If the database maintains relationships, [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] creates foreign key constraints using the SQL Server table name and **TableRelation** property information. The names of the constraints have the following format:  
  
-   \<table name>$FK$T\<referencing table ID>\_F\<referencing field ID>$T\<referenced table ID>.  
  
 Here is an example using the **Customer** table:  
  
-   CRONUS International Ltd\_$Customer$FK$T18\_F107$T308.  
  
 When you create a [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] table with keys that contain SumIndexFields, indexed views are created to hold the precalculated sums. These views are named based on the company, table name, and key number. For example \[CRONUS International Ltd\_$G\_L Entry$VSIFT$8\].  
  
## Representation of Data Types  
 Every available [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] data type is mapped to an appropriate SQL Server data type in the tables for [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)]. The following table shows which SQL Server data type is used for the corresponding [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] data type.  
  
|Microsoft Dynamics NAV data type|SQL Server data type|  
|--------------------------------------|--------------------------|  
|**Integer**|**INTEGER**|  
|**Option**|**INTEGER**|  
|**Code\(n\)**|**NVARCHAR\(n\)**<br /><br /> **INTEGER**<br /><br /> **SQL\_VARIANT**|  
|**Text\(n\)**|**NVARCHAR\(n\)**|  
|**Decimal**|**DECIMAL\(38,20\)**|  
|**Date**|**DATETIME**|  
|**Time**|**DATETIME**|  
|**DateTime**|**DATETIME**|  
|**Boolean**|**TINYINT**|  
|**BLOB**|**IMAGE**|  
|**DateFormula**|**VARCHAR\(32\)**|  
|**TableFilter**|**VARBINARY\(252\)**|  
|**BigInteger**|**BIGINT**|  
|**Duration**|**BIGINT**|  
|**GUID**|**UNIQUEIDENTIFIER**|  
|**RecordID**|**VARBINARY\(n\)**|  
  
 Each of the SQL Server data types is created as NOT NULL except the IMAGE type, which allows NULL.  
  
## See Also  
 [Developing Multilanguage-Enabled Applications](Developing-Multilanguage-Enabled-Applications.md)   
 [Field Data Types](Field-Data-Types.md)