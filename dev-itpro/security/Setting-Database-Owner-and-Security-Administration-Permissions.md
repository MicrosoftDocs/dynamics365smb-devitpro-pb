---
title: Granting permissions to manage databases
description: Learn how to set database owner and security admin permissions in SQL Server for your Business Central solution.
author: jswymer

ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 04/01/2021
---
# Granting Permissions to Manage [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Databases in SQL Server

Special permissions are required in SQL Server to create and manage [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases, for example by using [!INCLUDE[adminshell](../developer/includes/adminshell.md)] or [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)]. To grant these permissions to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] administrators, use [SQL Server Management Studio](/sql/ssms/sql-server-management-studio-ssms).  

## Permissions for using and creating databases
  
The administrator who installs [!INCLUDE[prod_short](../developer/includes/prod_short.md)] automatically has access to the database. To give another user permission to create new databases, grant that user the **sysadmin** Server Role for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] SQL Server instance in SQL Server Management Studio.  
  
> [!NOTE]  
> The administrator must also have a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] developer's license to use the development environment, and be assigned the SUPER permission set.  
  
In the Object Explorer pane in SQL Server Management Studio, follow these steps after connecting to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] SQL Server instance:  
  
1.  Expand the **Security** node, right-click **Logins**, and choose **New Login**.  
  
     If the administrator already has a login, right-click the user and choose **Properties**. Then go to step 4.  
  
2.  In the **Login – New** dialog box, select **Search**.  
  
3.  In the **Select User or Group** dialog box, select a valid Active Directory user.  
  
4.  In the **Login – New** dialog box, under **Select a Page**, choose **Server Roles**. Select the **sysadmin** check box.  
  
5.  Choose the **OK** button to close the **Login – New** dialog box.  
  
When administrators create [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases, the account running [!INCLUDE[server](../developer/includes/server.md)] is automatically granted the db\_owner database role for these databases.  
  
## Permissions for managing companies, objects, and licenses
  
Administrators who create [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases automatically have permission to manage companies, objects, and licenses in that database.  
  
To grant permission to manage companies, objects, and licenses to additional administrators, assign those administrators the db\_owner database role for all relevant [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases.  
  
To grant the db_owner role on a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database in SQL Server Management Studio, follow these steps:  
  
1.  If the administrator is not already a SQL Server login, add the administrator as a login by following the first three steps in the procedure above.  
  
2.  Select the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database, then **Security**, then right-click **Users** and choose **New User**.  
  
     Choose the button at the right of the **Login Name** field to open the **Select Login** dialog box.  
  
3.  Choose the **Browse** button, select the check box for the relevant login, and then choose the **OK** button.  
  
4.  Choose the **OK** button to exit the **Select Login** dialog box.  
  
5.  Enter a **User name** for the user.  
  
     This can be the same as the login name.  
  
6.  In the **Database User - New** dialog box, under **Select a Page**, choose In the **Database role membership**.  
  
7.  Select the **db_owner** check box.  
  
8.  Choose the **OK** button to exit the **Database User – New** dialog box.  
  
## See Also  
[Installation Considerations for Microsoft SQL Server](../deployment/installation-considerations-for-microsoft-sql-server.md)  
[Security and Protection](security-and-protection.md)  