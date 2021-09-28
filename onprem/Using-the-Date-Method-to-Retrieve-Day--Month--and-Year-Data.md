---
title: "Using the Date Method to Retrieve Day, Month, and Year Data"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 389a5299-4b33-46ba-baa6-62bc4332d261
caps.latest.revision: 18
manager: edupont
---
# Using the Date Method to Retrieve Day, Month, and Year Data
When you have fields in a table that contain dates, you can use a date method to retrieve only the year, month, or day instead of including the date in the resulting dataset of a query.  
  
## Setting Up a Date Method on a Query Column  
 To set up a date method on a query column, you can do one of the following from Query Designer:  
  
-   In the row that specifies the column, set the **Method Type** to **Date** and the **Method** to **Day**, **Month**, and **Year**.  
  
-   Open the properties of the column, and then set the [MethodType Property](MethodType-Property.md) to **Date** and [Method Property](Method-Property.md) to **Day**, **Month**, and **Year**.  
  
 For more information about how to set up query columns and properties, see [How to: Create Queries](How-to--Create-Queries.md).  
  
> [!IMPORTANT]  
>  You can only use a date method on fields that have a Date or DateTime data type. For additional information about how to use a date method on a field that has the DateTime data type, see [Working with DateTime Data Types](Using-the-Date-Method-to-Retrieve-Day--Month--and-Year-Data.md#DateTime).  
  
## Sample Table and Query  
 This topic uses the following sample table and query to demonstrate the different date methods.  
  
### Sample Sales Header Table  
 The following table contains data about sales orders for customers. The **Order Date** field has the data type of Date and the format DD-MM-YYYY, where DD is the day, MM is the month, and YYYY is the year.  
  
> [!NOTE]  
>  This is a simplified subset of the data that is found in table 36 Sales Header of the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
|No.|Bill-to Name|Order Date|  
|---------|-------------------|----------------|  
|1000|Autohaus Meilberg KG|18-01-2013|  
|5000|Autohaus Meilberg KG|21-05-2013|  
|4000|Beef House|30-09-2011|  
|3000|Deerfield Graphics Company|05-04-2012|  
|3000|Deerfield Graphics Company|29-04-2012|  
  
### Sample Query  
 The following illustration shows Query Designer for a query that retrieves data from the sample Sales Header table. The query includes a totals method that counts the total the number of records from the table included in the dataset.  
  
 ![Query Designer showing a date method.](media/NAV_Query_DateMethod_Example_QueryDesigner.png "NAV\_Query\_DateMethod\_Example\_QueryDesigner")  
  
> [!NOTE]  
>  A column that applies a date function is still part of the group unlike columns that apply a totals method.  
  
## Day Method  
 The Day method retrieves the day from the date expression of a field value in the query column. The day is returned as an integer, in the range of 1 to 31, which represents the day of the month. If the day in the date expression is 0, then 1 is returned.  
  
### Example  
 The following table displays the resulting dataset for the sample query with the **Method** property of the **Order Date** column set to **Day**.  
  
|Bill\_to\_Name|Day\_Order\_Date|Count\_|  
|--------------------|----------------------|-------------|  
|Autohaus Meilberg KG|18|1|  
|Autohaus Meilberg KG|21|1|  
|Beef House|30|1|  
|Deerfield Graphics Company|5|1|  
|Deerfield Graphics Company|29|1|  
  
## Month Method  
 The Month method retrieves the month from the date expression of a field value in the query column. The month is returned as an integer, in the range of 1 to 12, where 1 represents January and 12 represents December. If the month in the date expression is 0, then 1 is returned.  
  
### Example  
 The following table displays the resulting dataset for the sample query with the **Method** property of the **Order Date** column set to **Month**.  
  
|Bill\_to\_Name|Month\_Order\_Date|Count\_|  
|--------------------|------------------------|-------------|  
|Autohaus Meilberg KG|1|1|  
|Autohaus Meilberg KG|5|1|  
|Beef House|9|1|  
|Deerfield Graphics Company|4|2|  
  
## Year Method  
 The Year method gets the year from the date expression of a field value in the query column. The year is returned as an integer. If the year in the date expression is 0, then 1900 is returned.  
  
### Example  
 The following table displays the resulting dataset for the sample query with the **Method** property of the **Order Date** column set to **Year**.  
  
|Customer Name|Year\_Order\_Date|Count\_|  
|-------------------|-----------------------|-------------|  
|Autohaus Meilberg KG|2013|2|  
|Beef House|2011|1|  
|Deerfield Graphics Company|2012|2|  
  
##  <a name="DateTime"></a> Working with DateTime Data Types  
 On the SQL server, date and time values are processed using Coordinated Universal Time \(UTC\). If your [!INCLUDE[navnow](includes/navnow_md.md)] solution uses a time zone other than UTC and the field on which you apply the date method has a data type of DateTime, then there might be a difference between the date value that is returned in the dataset for the field and the actual day, month, or year for the field in the table. This occurs when the corresponding UTC date for a field falls on the next day or previous day because of the time of day and the time zone of [!INCLUDE[navnow](includes/navnow_md.md)] solution. The following table includes examples of DateTime values for two time zones that will return days, months, and years in a dataset that differ from the values in the table.  
  
|Time Zone|Date and Time in [!INCLUDE[navnow](includes/navnow_md.md)]|Day returned by Day method|Month returned by Month method|Year returned by Year method|  
|---------------|-------------------------------------------|--------------------------------|------------------------------------|----------------------------------|  
|Pacific Time \(UTC –8:00:00\)|12-31-2011 17:00:00|31|12|2011|  
|Middle European Time \(UTC +1:00:00\)|01-01-2012 00:59:00|1|1|2012|  
  
 The differences in day, month, or year occur because when a date and time value is retrieved from the [!INCLUDE[navnow](includes/navnow_md.md)] database table, it is converted from the regional settings of the [!INCLUDE[navnow](includes/navnow_md.md)] solution to the UTC date and time. The day, month, or year is calculated on the SQL server, and then returned to the query dataset as an integer, which does not consider the regional settings of the [!INCLUDE[navnow](includes/navnow_md.md)] solution.  
  
 To avoid this condition, you should use the date method on fields that have a Date data type instead of a DateTime data type whenever possible. You can also return the DateTime value and implement post processing for the day, month, and year as needed.  
  
## See Also  
 [How to: Create Queries](How-to--Create-Queries.md)   
 [Understanding Query Totals and Grouping](Understanding-Query-Totals-and-Grouping.md)   
 [MethodType Property](MethodType-Property.md)   
 [Method Property](Method-Property.md)