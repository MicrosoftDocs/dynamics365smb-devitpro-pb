---
title: SQL Data Type Property
description: SQL data type property sets the data type that you want to allow in a code field. The values available are Varchar, Integer, BigInteger, and Variant.
ms.custom: na
ms.date: 10/30/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b1e5c043-9398-4229-95f9-79ca3754b5c3
caps.latest.revision: 8
manager: edupont
---
# SQL Data Type Property in Dynamics NAV
Sets the data type that you want to allow in a code field.  
  
## Applies To  
 Code fields in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] with Microsoft SQL Server.  
  
## Remarks  
 The values available are Varchar, Integer, BigInteger, and Variant. Leaving the value set at \<Undefined>means that you accept the default setting, which is Varchar.  
  
> [!NOTE]  
>  The Variant option is represented by the SQL\_VARIANT SQL data type that has been introduced in SQL Server 2000 and is not supported by SQL Server 7.0. This means that selecting Variant as the SQL Data Type property when creating or modifying a table on SQL Server 7.0 results in an error.  
  
## Varchar  
 If you set SQL Data Type to Varchar, all the values in the field are compared and sorted as character data, including numeric values.  
  
## Integer  
 If you set SQL Data Type to Integer, then the following are true:  
  
-   All the values in the field are compared and sorted as integers. No alphanumeric values can be stored in the field.  
  
-   If you enter negative values in the column outside [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] using external tools, they cannot be read into [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)].  
  
-   The value "0" \(zero\) is used to represent an empty string in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)].  
  
-   Non-numeric code values or any numeric values beginning with "0" \(zero\) cannot be entered in the code field.  
  
## Variant  
 If you set SQL Data Type to Variant, then the following are true:  
  
-   The values in the field are compared and sorted according to their base data type. Numeric values are sorted after alphanumeric values.  
  
-   Data that is entered into the code field in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] is stored as either the Varchar or Integer base data type, depending on the value that has been entered.  
  
-   Any value beginning with "0" \(zero\) can be entered in the code field and is stored as an Integer base data type.  
  
    > [!NOTE]  
    >  You can change the SQL Data Type of a code field from Varchar or Integer to Variant and the data in the column is changed accordingly. You cannot change the SQL Data Type of a code field from Variant to Varchar or Integer, unless there are no rows in the table or unless the field contains only an empty string in every row.  
  
## See Also  
 [Properties](Properties.md)   
 [Integer Data Type](Integer-Data-Type.md)   
 [BigInteger Data Type](BigInteger-Data-Type.md)   
 [Variant Data Type](Variant-Data-Type.md)