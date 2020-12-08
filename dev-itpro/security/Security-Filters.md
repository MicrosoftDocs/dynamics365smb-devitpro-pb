---
title: "Security Filter Modes"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
author: jswymer
---
# Using Security Filters

For record-level security in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you use security filters to limit a user's access to data in a table. You create security filters on table data. A security filter describes a set of records in a table that a user has permission to access. You can specify, for example, that a user can only read the records that contain information about a particular customer. This means that the user cannot access the records that contain information about other customers.

There are two parts to implementing security filters.

- Creating the security filters on the table is typically done by an application administrator.
-  Defining how the application behaves when the filters are applied is done in application code by a developer. 

## Creating security filters

You create security filter by using the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client. You set security filters on permission sets, which you assign to users. For more information about permission sets, see [Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions).  
  
  
1.  Open the **Permission Sets** page.  
  
2.  On the **Permission Sets** page, select the permission set to which you want to add a security filter, and then choose **Permissions**.  
  
3.  On the **Permissions** page, in the row for the table data to which you want to add a security filter, select the **Security Filter** column to open the **Table Filter** page.  
  
4.  In the **Table Filter** page, in the **Field Number** column, select the field on which you want to limit a user's access.

    For example, if you want to create a security filter so that a user can view only sales with a specific salesperson code, then choose the field number for the **Salesperson Code** field.
  
    The **Field Caption** column in the **Table Filter** page is filled in automatically after you select the field number.  
  
5.  In the **Field Filter** column, enter the value of field that you want to use to limit access.

    For example, to limit a user's access to only Annette Hill's sales, enter **AH**, which is the salesperson code for Annette Hill, in the **Field Filter** column.
  
    > [!NOTE]  
    >  Record level security filters do not support wildcard characters. This means that you cannot use \* and ? in the filters. You can use other symbols, delimiters and, operators, such as, \<, >, &#124;, &, .., and =. If you do not enter an operator, then the default operator = is used.  
    >
    >  Security filters support Unicode characters. The maximum length of a security filter is 200 characters, including all field names, delimiters, symbols, and operators that used in the filter.  
    >  
    >  When multiple permission sets that refer to the same table data are assigned to a user, they are combined so that the least restrictive filter is used. You should not repeat a table in multiple permission sets if you plan to combine those permissions sets for one user.  
  
## Setting security filter behavior in application code
  
When you create security filters, you limit a user's access to data in a table. Therefore, code that requires access to all data in a table fails and the user receives an error message.  
  
You can resolve potential conflicts with security filters and specify the desired behavior by setting the security filtering mode on Record variables to determine how the security filters are applied.  

Query objects and record objects, including both explicit record variables and implicit records on pages, reports, or XMLports, have a property named [SecurityFiltering](../developer/properties/devenv-securityfiltering-property.md), which describes how security filters are applied. The possible values of the **SecurityFiltering** property are:  

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
>-  If security filters have been set, then the **Validated** value decreases performance. For more information, see [Performance Impact of Security Filtering Mode](Security-Filters.md#PerformanceImpact).  
>-  The **Validated** value is used mainly for compatibility with the security model in earlier versions of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. We recommend that you use the other modes when you implement your security model.
>-  The **Validated** value is only supported for security filters that consist of a single field. If you set up more than one field on a security filter, you may get undesired results.

## Ignored
  
 If a record is set to **Ignored**, then any security filters that have been set are ignored for this instance of the record.  

 An example scenario in which you use the **Ignored** value is that one salesperson is not allowed to view customers, sales quotes, or sales orders that belong to another salesperson. However, to post her sales orders, the salesperson must have access to all entries in the Customer Ledger Entry table so that the posting algorithm can find the last sales order entry number and generate the correct number for the next entry. In the code that posts sales orders, you set the **SecurityFiltering** property of the record variable to **Ignored**, but for record variables in other parts of the code, you set the **SecurityFiltering** property to either **Filtered** or **Validated**.  

 When you set the **SecurityFiltering** property on a record to **Ignored**, the administrator who sets a security filter is not informed that the security filter will be ignored. You must be careful when you set the **SecurityFiltering** property that it does not cause unintended information disclosure.  

## Disallowed
  
 If a record is set to **Disallowed**, then setting any security filter on the record causes an error.  

 An example scenario in which you use the **Disallowed** value is that you have batch jobs that must be run only by users who have access to all records in the related tables, otherwise the batch jobs can cause incorrect and potentially harmful results. The partner developer sets record variables on these batch jobs to **Disallowed** so that a user who does not have access to all records in the related tables receives an error.  

## Default values
  
 The following table shows the default values of the **SecurityFiltering** property.  

||Explicit record variables|Explicit query variables|Implicit records on pages, reports, and XMLports|  
|-|-------------------------------|------------------------------|------------------------------------------------------|  
|**New**|Validated|Filtered|Filtered|  

> [!IMPORTANT]  
> It is not supported to change the default **Filtered** value of the **SecurityFiltering** property on implicit records on pages.  

> [!NOTE]  
> For Query variables, the **Validated** value of the **SecurityFiltering** property is not allowed.  

## Security filters and FlowFields
  
 If you set a security filter on a table that is used in a FlowField calculation, then the calculated value of the FlowField is filtered, based on the security filter and the security filter mode of the record variable for the record in the table. For example, if you set a security filter so that a user can only view sales with a specific salesperson code, and if the security filter mode is **Filtered**, then when the user views a FlowField that calculates total sales, the user can see the total of only those sales that have the specific salesperson code. In earlier versions of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the security filter mode value was **Validated** and in this example, the user received an error.  

## Programming examples
  
 For these examples, you have a table that has 100 records. Each record has an ID field that is the primary key of the table. The values of the ID field that are currently in the database range from 1 to 100. In this example, you set a security filter on the table data for ID=1..50. Then, in a codeunit you create a record variable for the table.  

|Security filter mode|Example|  
|--------------------------|-------------|  
|Filtered|If you set the **SecurityFiltering** property on the record variable to **Filtered**, then the code behaves as if records with ID values from 1 to 50 are the only records that exist. If you call the **FIND**, **FINDFIRST**, **FINDLAST**, or **FINDSET** function on the record variable without any additional filters besides the security filter, then the function only finds records with ID values from 1 to 50. If you call the **DELETEALL** function, then it successfully deletes records with ID values from 1 to 50. It does not delete records with ID values greater than 50, and it does not return an error. If you modify a record, for example, by calling the **MODIFY** function on a record with an ID value less than 50, then the function succeeds. If you call the **MODIFY** function on a record with an ID value greater than 50, then it fails because you do not have access to the record. If you insert a record with an ID less than 50 and the record does not already exist, the **INSERT** function succeeds. If you insert a record with an ID greater than 50 and the record does not already exist, it fails because you do not have access to the record. If you call the **GET** function on a record with an ID value less than 50, then the function succeeds. If you call the **GET** function on a record with an ID value greater than 50, then it fails.|  
|Validated|If you set the **SecurityFiltering** property on the record variable to **Validated**, then the code behaves as if records with ID values from 1 to 100 exist, but you only have access to the records that are specified by the security filter. If you call the **FIND**, **FINDFIRST**, **FINDLAST**, or **FINDSET** function on the record variable without additional filters, it finds all 100 records, but a **NEXT** function call to the record with ID value 51 fails because you do not have access to it. If you call the **DELETEALL** function, it fails because it finds all 100 records but you do not have access to all of them. If you modify a record with an ID value less than 50, it succeeds. If you modify a record with an ID value greater than 50, it fails. If you insert a record with an ID less than 50 and the record does not already exist, it succeeds. If you insert a record with an ID greater than 50 and the record does not already exist, it fails.|  
|Ignored|If you set the **SecurityFiltering** property on the record variable to **Ignored**, then the code behaves as if all security filters that are set do not exist for that instance of the record. Any of the **FIND** functions find all 100 records. The **DELETEALL** function deletes all 100 records. You can insert and modify records in any range, regardless of security filters.|  
|Disallowed|If you set the **SecurityFiltering** property on the record variable to **Disallowed**, then as long as a security filter is set on the record, any code that uses the record variable causes an error.|  

##  <a name="PerformanceImpact"></a> Performance impact of security filtering mode
  
Security filters are handled by SQL Server just like other filters that are applied by the user. They do not adversely affect performance unless the security filtering mode is **Validated**.

If security filters are set on a table, then setting the **SecurityFiltering** property to **Validated** on a record instance of that table causes a decrease in performance. The [!INCLUDE[server](../developer/includes/server.md)] must go through every record in the table to validate the record instead of adding the filters to the query that is sent to SQL Server.  

If security filters are not set, then setting the **SecurityFiltering** property to **Validated** has no performance impact.  

> [!NOTE]  
> We recommend that you change commonly used record variables from the default value of **Validated** to either **Filtered** or **Ignored** to improve performance.  

## See Also  

[Record-Level Security](data-security.md)   

