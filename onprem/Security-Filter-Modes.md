---
title: "Security Filter Modes"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: jswymer
manager: edupont
---
# Security Filter Modes
Query objects and Record objects, including both explicit record variables and implicit records on pages, reports, or XMLports, have a property named **SecurityFiltering**, which describes how security filters are applied. The possible values of the **SecurityFiltering** property are:  

-   **Filtered**  
-   **Validated**  
-   **Ignored**  
-   **Disallowed**  

## Filtered  
 If a record is set to **Filtered**, then any security filters that have been set are respected for this instance of the record. To the user, it is as if records outside the security filters that do not exist.  

 An example scenario in which you use the **Filtered** value is that one salesperson is not allowed to view customers, sales quotes, or sales orders that belong to another salesperson. When the salesperson opens a list of customers or sales documents, or runs reports such as the Customer – Top 10 List report, he sees his filtered view of customers, sales quotes, and sales orders.  

## Validated  
 If a record is set to **Validated**, then any security filters that have been set are respected for this instance of the record, and an error occurs if the code attempts to access a record that is outside the range of the security filters.  

 An example scenario in which you use the **Validated** value is that one parts purchaser in a warehouse is responsible for only one location and can view and create purchase orders for only that location. However, some purchase orders have lines for multiple locations. Only a parts purchaser who has access to all locations should be allowed to post these purchase orders that have lines for multiple locations. All other purchasers receive an error.  

>[!IMPORTANT]
>Before you use the **Validated** value, you should consider the following:
>-  If security filters have been set, then the **Validated** value decreases performance. For more information, see [Performance Impact of Security Filtering Mode](Security-Filter-Modes.md#PerformanceImpact).  
>-  The **Validated** value is used mainly for compatibility with the security model in earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)]. We recommend that you use the other modes when you implement your security model.
>-  The **Validated** value is only supported for security filters that consist of a single field. If you set up more than one field on a security filter, you may get undesired results.

## Ignored  
 If a record is set to **Ignored**, then any security filters that have been set are ignored for this instance of the record.  

 An example scenario in which you use the **Ignored** value is that one salesperson is not allowed to view customers, sales quotes, or sales orders that belong to another salesperson. However, to post her sales orders, the salesperson must have access to all entries in the Customer Ledger Entry table so that the posting algorithm can find the last sales order entry number and generate the correct number for the next entry. In the code that posts sales orders, you set the **SecurityFiltering** property of the record variable to **Ignored**, but for record variables in other parts of the code, you set the **SecurityFiltering** property to either **Filtered** or **Validated**.  

 When you set the **SecurityFiltering** property on a record to **Ignored**, the administrator who sets a security filter is not informed that the security filter will be ignored. You must be careful when you set the **SecurityFiltering** property that it does not cause unintended information disclosure.  

## Disallowed  
 If a record is set to **Disallowed**, then setting any security filter on the record causes an error.  

 An example scenario in which you use the **Disallowed** value is that you have batch jobs that must be run only by users who have access to all records in the related tables, otherwise the batch jobs can cause incorrect and potentially harmful results. The partner developer sets record variables on these batch jobs to **Disallowed** so that a user who does not have access to all records in the related tables receives an error.  

## Default Values  
 The following table shows the default values of the **SecurityFiltering** property.  

||Explicit record variables|Explicit query variables|Implicit records on pages, reports, and XMLports|  
|-|-------------------------------|------------------------------|------------------------------------------------------|  
|**Upgraded from Microsoft Dynamics NAV 2009**|Validated|N/A|Filtered|  
|**New**|Validated|Filtered|Filtered|  

> [!IMPORTANT]  
>  It is not supported to change the default **Filtered** value of the **SecurityFiltering** property on implicit records on pages.  

 If you keep the default values after you upgrade from [!INCLUDE[navnow](includes/navnow_md.md)] 2009 to [!INCLUDE[navnowlong](includes/navnowlong_md.md)], then the behavior is the same in all cases except the following:  

-   In earlier versions, the [COUNT Function \(Record\)](COUNT-Function--Record-.md) ignored security filters and always returned the total number of records unless you called the SETPERMISSIONFILTER function to get a filtered count. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the COUNT function adheres to the **SecurityFiltering** property.  

-   In earlier versions, on a page, you could modify or insert a record outside of the range of your security filters but in [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you cannot.  

> [!NOTE]  
>  For Query variables, the **Validated** value of the **SecurityFiltering** property is not allowed.  

## Security Filters and FlowFields  
 If you set a security filter on a table that is used in a FlowField calculation, then the calculated value of the FlowField is filtered, based on the security filter and the security filter mode of the record variable for the record in the table. For example, if you set a security filter so that a user can only view sales with a specific salesperson code, and if the security filter mode is **Filtered**, then when the user views a FlowField that calculates total sales, the user can see the total of only those sales that have the specific salesperson code. In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], the security filter mode value was **Validated** and in this example, the user received an error.  

## Programming Examples  
 For these examples, you have a table that has 100 records. Each record has an ID field that is the primary key of the table. The values of the ID field that are currently in the database range from 1 to 100. In this example, you set a security filter on the table data for ID=1..50. Then, in a codeunit you create a record variable for the table.  

|Security filter mode|Example|  
|--------------------------|-------------|  
|Filtered|If you set the **SecurityFiltering** property on the record variable to **Filtered**, then the code behaves as if records with ID values from 1 to 50 are the only records that exist. If you call the **FIND**, **FINDFIRST**, **FINDLAST**, or **FINDSET** function on the record variable without any additional filters besides the security filter, then the function only finds records with ID values from 1 to 50. If you call the **DELETEALL** function, then it successfully deletes records with ID values from 1 to 50. It does not delete records with ID values greater than 50, and it does not return an error. If you modify a record, for example, by calling the **MODIFY** function on a record with an ID value less than 50, then the function succeeds. If you call the **MODIFY** function on a record with an ID value greater than 50, then it fails because you do not have access to the record. If you insert a record with an ID less than 50 and the record does not already exist, the **INSERT** function succeeds. If you insert a record with an ID greater than 50 and the record does not already exist, it fails because you do not have access to the record. If you call the **GET** function on a record with an ID value less than 50, then the function succeeds. If you call the **GET** function on a record with an ID value greater than 50, then it fails.|  
|Validated|If you set the **SecurityFiltering** property on the record variable to **Validated**, then the code behaves as if records with ID values from 1 to 100 exist, but you only have access to the records that are specified by the security filter. If you call the **FIND**, **FINDFIRST**, **FINDLAST**, or **FINDSET** function on the record variable without additional filters, it finds all 100 records, but a **NEXT** function call to the record with ID value 51 fails because you do not have access to it. If you call the **DELETEALL** function, it fails because it finds all 100 records but you do not have access to all of them. If you modify a record with an ID value less than 50, it succeeds. If you modify a record with an ID value greater than 50, it fails. If you insert a record with an ID less than 50 and the record does not already exist, it succeeds. If you insert a record with an ID greater than 50 and the record does not already exist, it fails.|  
|Ignored|If you set the **SecurityFiltering** property on the record variable to **Ignored**, then the code behaves as if all security filters that are set do not exist for that instance of the record. Any of the **FIND** functions find all 100 records. The **DELETEALL** function deletes all 100 records. You can insert and modify records in any range, regardless of security filters.|  
|Disallowed|If you set the **SecurityFiltering** property on the record variable to **Disallowed**, then as long as a security filter is set on the record, any code that uses the record variable causes an error.|  

##  <a name="PerformanceImpact"></a> Performance Impact of Security Filtering Mode  
 If security filters are set on a table, then setting the **SecurityFiltering** property to **Validated** on a record instance of that table causes a decrease in performance. The [!INCLUDE[nav_server](includes/nav_server_md.md)] must go through every record in the table to validate the record instead of adding the filters to the query that is sent to SQL Server.  

 If security filters are not set, then setting the **SecurityFiltering** property to **Validated** has no performance impact.  

> [!NOTE]  
>  We recommend that you change commonly used record variables from the default value of **Validated** to either **Filtered** or **Ignored** to improve performance.  

## See Also  
 [Record-Level Security](Record-Level-Security.md)   
 [How to: Set Security Filters](How-to--Set-Security-Filters.md)   
 [SecurityFiltering Property](SecurityFiltering-Property.md)
