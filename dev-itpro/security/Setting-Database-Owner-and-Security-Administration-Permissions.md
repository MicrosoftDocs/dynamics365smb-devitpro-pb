---
title: Granting permissions to manage databases
description: Learn how to set database owner and security admin permissions in SQL Server for your Business Central solution.
author: jswymer

ms.topic: conceptual
ms.author: jswymer
ms.date: 10/26/2024
ms.reviewer: jswymer
---
# Granting Permissions to Manage [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Databases in SQL Server

Special permissions are required in SQL Server to create and manage [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases, for example by using [!INCLUDE[adminshell](../developer/includes/adminshell.md)] or [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)]. To grant these permissions to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] administrators, use [SQL Server Management Studio](/sql/ssms/sql-server-management-studio-ssms).  

## Permissions for using and creating databases
  
The administrator who installs [!INCLUDE[prod_short](../developer/includes/prod_short.md)] automatically has access to the database. To give another user permission to create new databases, grant that user the **dbcreator** Server Role for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] SQL Server instance in SQL Server Management Studio.  
  
> [!NOTE]  
> The administrator must also have a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] developer's license to use the development environment, and be assigned the SUPER permission set.  
  
In the Object Explorer pane in SQL Server Management Studio, follow these steps after connecting to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] SQL Server instance:  
  
1. Expand the **Security** node, right-click **Logins**, and select **New Login**.  
  
   If the administrator already has a login, right-click the user and select **Properties**. Then go to step 4.  
  
1. In the **Login – New** dialog box, select **Search**.  
  
1. In the **Select User or Group** dialog box, select a valid Active Directory user.  
  
1. In the **Login – New** dialog box, under **Select a Page**, select **Server Roles**. Select the **dbcreator** check box.  
  
1. Select the **OK** button to close the **Login – New** dialog box.  
  
When administrators create [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases, the account running [!INCLUDE[server](../developer/includes/server.md)] is automatically granted the db\_owner database role for these databases.  
  
## Permissions for managing companies, objects, and licenses
  
Administrators who create [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases automatically have permission to manage companies, objects, and licenses in that database.  
  
To grant permission to manage companies, objects, and licenses to additional administrators, assign those administrators the db\_owner database role for all relevant [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases.  
  
To grant the db_owner role on a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database in SQL Server Management Studio, follow these steps:  
  
1. If the administrator is not already a SQL Server login, add the administrator as a login by following the first three steps in the procedure above.  
1. Select the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database, then **Security**, then right-click **Users** and select **New User**.  
  
   Select the button at the right of the **Login Name** field to open the **Select Login** dialog box.  
  
1. Select the **Browse** button, select the check box for the relevant login, and then select the **OK** button.  
1. Select the **OK** button to exit the **Select Login** dialog box.  
1. Enter a **User name** for the user.  
  
   This value can be the same as the login name.  
  
1. In the **Database User - New** dialog box, under **Select a Page**, select In the **Database role membership**.  
1. Select the **db_owner** check box.  
1. Select the **OK** button to exit the **Database User – New** dialog box.  
  
## Related information
  
[Installation considerations for Microsoft SQL Server](../deployment/installation-considerations-for-microsoft-sql-server.md)  
[Security and protection](security-and-protection.md)  