---
title: "Configuring User Permissions to Queries"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ce7ff692-560d-4c0b-9461-fdd935af3ecf
caps.latest.revision: 12
---
# Configuring User Permissions to Queries
You can control which users have permission to run a query object and access its resulting dataset. Similar to other [!INCLUDE[navnow](includes/navnow_md.md)] objects, you grant permission to a query in a permission set that you assign to the user's Windows account.  
  
 The following permissions are required as a minimum:  
  
-   Read permission on the **Query** object.  
  
-   Read permission on each table that is specified as a data item in the query.  
  
-   Read permission on any objects that are called from the query's ONBEFOREOPEN trigger.  
  
## Granting Users Permission to a Query  
 To grant a user permission to query, you can either change an existing permission set or create a new permission set and then assign it to the user. You create and modify a permission set using the [!INCLUDE[rtc](includes/rtc_md.md)].  
  
#### To grant users permission to a query  
  
1.  Start the [!INCLUDE[rtc](includes/rtc_md.md)].  
  
2.  In the **Search** box, enter **Permission Sets**, and then choose the related link.  
  
     The **Permission Sets** page opens.  
  
3.  Open an existing permission set for editing or create a new permission set.  
  
     For more information about how to create and editing permissions sets, see [How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md).  
  
4.  Add the following permissions to the permission set:  
  
    -   Include a **Query** object type permission that specifies the query, and set the **Read Permission** to **Yes**. Additional permissions are not relevant.  
  
    -   For each data item in the query, include a **Table Data** object type permission that specifies the underlying table of the data item, and set the **Read Permission** to **Yes** or **Indirect**.  
  
         If you choose **Indirect**, you must also set the Permissions property of the query object to specify the table with at least **Read** permission. For more information, see [Permissions Property](Permissions-Property.md).  
  
         Set additional permissions are needed.  
  
    -   If the query will be executed from the C/AL code of another object, such as a codeunit, then for each data item add a **Table** object type permission that specifies the underlying table. Set the **Read Permission** to **Yes**. Set additional permissions as needed.  
  
    -   If there are any objects that are called from the query's ONBEFOREOPEN trigger, then include a permission entry for each object, and set the **Read Permission** set to **Yes**. Set additional permissions as required.  
  
5.  When the permission set is complete, choose the **OK** button to close the **Edit – Permissions** page.  
  
6.  Assign the permission set to users who require access to the query.  
  
     For more information, see [How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md).  
  
## Query Permissions Example  
 The following table illustrates a permission set for query 50001 Customer\_SalesQuantity that retrieves data from table 18 Customer and table 37 Sales Lines. The query will be executed from the C/AL code of codeunit. The user only requires access to the Sales Line table through the query, so you grant indirect access to this table, which you set up in the permission set and query's Permission property. This permission set configures the minimum permissions that are required for a user to run the query and access the resulting dataset.  
  
|Object type|Object ID|Object name|Read permission|Insert permission|Modify permission|Delete permission|Execute permission|Security Filter|  
|-----------------|---------------|-----------------|---------------------|-----------------------|-----------------------|-----------------------|------------------------|---------------------|  
|Table Data|18|Customer|Yes||||||  
|Table Data|37|Sales Line|Indirect||||||  
|Query|50001|Customer\_SalesQuantity|Yes||||||  
  
 To give indirect permission to table 37 Sales Line from the query, set the Permissions property of the query object to the following value  
  
 **TableData Sales Line=r**  
  
> [!NOTE]  
>  For step-by-step instructions about how to create the query discussed in this example, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).  
  
## See Also  
 [Managing Permissions and Permission Sets](Managing-Permissions-and-Permission-Sets.md)   
 [How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md)   
 [How to: Create Queries](How-to--Create-Queries.md)   
 [Permissions Property](Permissions-Property.md)
