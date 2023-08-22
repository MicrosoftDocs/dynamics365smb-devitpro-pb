---
title: "Data Format Considerations"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 68464c90-1e5b-4317-90b1-1c68cb5a0dd2
caps.latest.revision: 12
---
# Data Format Considerations
In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], data formats impact the way your data is compared and sorted  
  
## Code Fields  
 In [!INCLUDE[navnowlong](includes/navnowlong_md.md)] code fields can be represented by several SQL Server data types. Code fields have a property, **SQL Data Type**, which determines whether they contain integers, text strings, or a mixture of both.  
  
#### To set code field properties  
  
1.  On the **Tools**, choose **Object Designer**.  
  
2.  Choose **Table** and select the appropriate table.  
  
3.  Choose **Design**.  
  
4.  Select the field whose data type is defined as code, choose **View**, and then choose **Properties**.  
  
 You can set the **SQL Data Type** property to **Varchar**, **Integer**, or **Variant**. Leaving the value as **Undefined** is the same as selecting **Varchar**, which is the default value.  
  
> [!NOTE]  
>  When you set the **SQL Data Type** property to **Varchar**, the SQL Server data type that is used is **NVARCHAR**.  
  
 When you create a table in [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the code field data is stored in NVARCHAR, INTEGER, or SQL\_VARIANT columns in the SQL Server table that correspond to the **SQL Data Type** property’s values **Varchar**, **Integer**, or **Variant**.  
  
### Varchar  
 When you set the value of the **SQL Data Type** property of a code field to **Varchar**, all the values in the field are compared and sorted as character data, including numeric values.  
  
### Integer  
 When you set the value of the **SQL Data Type** property of a code field to **Integer**:  
  
-   All the values in the field are compared and sorted as integers. No alphanumeric values can be stored in the field.  
  
-   If you enter negative values in the column outside [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] using external tools, they cannot be read into [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)].  
  
-   The value "0" \(zero\) is used to represent an empty string in [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)].  
  
-   Nonnumeric code values or any numeric values beginning with "0" \(zero\) cannot be entered in the code field.  
  
### Variant  
 When you set the value of the **SQL Data Type** property of a code field to **Variant**:  
  
-   The values in the field are compared and sorted according to their base data type. Numeric values are sorted after alphanumeric values.  
  
-   Data that is entered into the code field in [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] is stored as either the **NVARCHAR** or **INTEGER** base data type, depending on the value that has been entered.  
  
-   Any value beginning with "0" \(zero\) can be entered in the code field and is stored as an **INTEGER** base data type.  
  
> [!NOTE]  
>  Be aware that the Variant data type is not supported by all the third-party tools that can be used to access data in SQL Server databases.  
  
## Data and Time Fields  
 SQL Server stores information about both date and time in columns of the DATETIME and SMALLDATETIME types. For date fields, [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] uses only the date part and places a constant value for the time. For a normal date, this contains 00:00:00:000. For a closing date, it contains 23:59:59:000 for a DATETIME and 23:59:00:000 for a SMALLDATETIME.  
  
 The [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] undefined date is represented by the earliest valid date in SQL Server: 01-01-1753 00:00:00:000 for a DATETIME, and 01-01-1900 00:00:00:000 for a SMALLDATETIME.  
  
 For time fields, only a SQL Server DATETIME type can be used. [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] uses only the time and places a constant value for the date: 01-01-1754. The [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] undefined time is represented by the same value as an undefined date.  
  
 In order for [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] to interpret date and time values correctly, the formats mentioned earlier must be used when linking [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] table definitions to external tables or views. For more information, see [Using Linked Objects](Using-Linked-Objects.md).  
  
 To reformat a DATETIME or SMALLDATETIME column that is to be used as a date field in [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)], an `UPDATE` statement can be applied to the table data. The following is an example of such an update statement.  
  
```  
UPDATE [My Table] SET [My Date] = CONVERT(CHAR(10), [My Date], 120)  
```  
  
 For a closing date, a `CONVERT` style of 120 can be used to set the appropriate time part. To reformat a time field, a similar statement can be used.  
  
```  
UPDATE [My Table] SET [My Time] = CAST('1754-01-01 '+CONVERT(CHAR(8), [My Time], 108) AS DATETIME)  
```  
  
 As an alternative to modifying the table data, you can create a view that applies the necessary conversion to the column and gives the column an alias. However, you cannot update views that are created in this way and it is more efficient to change the data than to apply conversions for every row.  
  
> [!NOTE]  
>  The information about date and time fields only applies to fields of the Date data type and Time data type; it does not apply to fields of the DateTime data type.  
  
## See Also  
 [Field Data Types](Field-Data-Types.md)   
 [Identifiers, Data Types, and Data Formats](Identifiers--Data-Types--and-Data-Formats.md)
