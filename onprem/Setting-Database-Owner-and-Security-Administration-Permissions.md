---
title: "Setting Database Owner and Security Administration Permissions"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 95b2429f-6fb2-4257-9ed6-57ad6529b909
caps.latest.revision: 29
manager: edupont
---
# Setting Database Owner and Security Administration Permissions
Permissions are required in SQL Server to create and manage [!INCLUDE[navnow](includes/navnow_md.md)] databases. Use SQL Server Management Studio to grant these permissions to [!INCLUDE[navnow](includes/navnow_md.md)] administrators.  
  
 If you have installed SQL Server with the guidelines in [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md), then SQL Server Management Studio is already installed on your computer. Otherwise, update your SQL Server installation to include the **Management Tools - Complete option for SQL Server**.  
  
## Permissions for Using and Creating Databases  
 The administrator who installs [!INCLUDE[navnowlong](includes/navnowlong_md.md)] automatically has access to the [!INCLUDE[navnow](includes/navnow_md.md)] database in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. To grant another user permission to create new databases in [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], grant that user the sysadmin Server Role for the [!INCLUDE[navnow](includes/navnow_md.md)] SQL Server instance in SQL Server Management Studio.  
  
> [!NOTE]  
>  The administrator must also have a [!INCLUDE[navnow](includes/navnow_md.md)] developer’s license to use the development environment, and be assigned the SUPER permission set.  
  
 In the Object Explorer pane in SQL Server Management Studio, follow these steps after connecting to the [!INCLUDE[navnow](includes/navnow_md.md)] SQL Server instance:  
  
1.  Expand the **Security** node, right-click **Logins**, and choose **New Login**.  
  
     If the administrator already has a login, right-click the user and choose **Properties**. Then go to step 4.  
  
2.  In the **Login – New** dialog box, select **Search**.  
  
3.  In the **Select User or Group** dialog box, select a valid Active Directory user.  
  
4.  In the **Login – New** dialog box, under **Select a Page**, choose **Server Roles**. Select the **sysadmin** check box.  
  
5.  Choose the **OK** button to close the **Login – New** dialog box.  
  
 When administrators create [!INCLUDE[navnow](includes/navnow_md.md)] databases in the [!INCLUDE[navnow](includes/navnow_md.md)] development environment, the account running [!INCLUDE[nav_server](includes/nav_server_md.md)] is automatically granted the db\_owner database role for these databases.  
  
## Permissions for Managing Companies, Objects, and Licenses  
 Administrators who create [!INCLUDE[navnow](includes/navnow_md.md)] databases automatically have permission to manage companies, objects, and licenses in that database.  
  
 To grant permission to manage companies, objects, and licenses in [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to additional administrators, assign those administrators the db\_owner database role for all relevant [!INCLUDE[navnow](includes/navnow_md.md)] databases.  
  
 To grant the db_owner role on a [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server Management Studio, follow these steps:  
  
1.  If the administrator is not already a SQL Server login, add the administrator as a login by following the first three steps in the procedure above.  
  
2.  Select the [!INCLUDE[navnow](includes/navnow_md.md)] database, then **Security**, then right-click **Users** and choose **New User**.  
  
     Choose the button at the right of the **Login Name** field to open the **Select Login** dialog box.  
  
3.  Choose the **Browse** button, select the check box for the relevant login, and then choose the **OK** button.  
  
4.  Choose the **OK** button to exit the **Select Login** dialog box.  
  
5.  Enter a **User name** for the user.  
  
     This can be the same as the login name.  
  
6.  In the **Database User - New** dialog box, under **Select a Page**, choose In the **Database role membership**.  
  
7.  Select the **db_owner** check box.  
  
8.  Choose the **OK** button to exit the **Database User – New** dialog box.  
  
## See Also  
 [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md)