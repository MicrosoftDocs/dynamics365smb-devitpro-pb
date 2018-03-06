---
title: Configure SQL Server Authentication
description: This topic describes how to configure SQL Server Authentication between the Dynamics NAV Server instance and a Dynamics NAV database. 
ms.custom: na
ms.date: 11/24/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: acd13069-9014-4c04-84b2-05a94a2cc776
caps.latest.revision: 7
manager: edupont
---
# Configuring SQL Server Authentication in Dynamics NAV
This topic describes how to configure SQL Server Authentication between the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and a [!INCLUDE[navnow](includes/navnow_md.md)] database. You perform the configuration in two places: on the databases in SQL Server and on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. The procedure is different when the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured as a multitenant server instance than when it is not a multitenant server instance. To configure SQL Server authentication, complete the following procedures:  
  
1.  [Set Up an Encryption Key](How-to--Configure-SQL-Server-Authentication-in-Microsoft-Dynamics-NAV.md#SetEncryptionKey)  
  
2.  [Configure SQL Authentication on the Database](How-to--Configure-SQL-Server-Authentication-in-Microsoft-Dynamics-NAV.md#ConfigSQL)  
  
3.  [Configure SQL Server Authentication on Microsoft NAV Server Instance (Non-Multitenant)](How-to--Configure-SQL-Server-Authentication-in-Microsoft-Dynamics-NAV.md#ConfigNavServer) or [Configure SQL Server Authentication on Microsoft NAV Server Instance in a Multitenant Deployment](How-to--Configure-SQL-Server-Authentication-in-Microsoft-Dynamics-NAV.md#ConfigNavServerMT)  
  
##  <a name="SetEncryptionKey"></a> Set Up an Encryption Key  
 When using SQL Server authentication, [!INCLUDE[navnow](includes/navnow_md.md)] requires an encryption key to encrypt the credentials \(user name and password\) that the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance uses to connect to the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server. The encryption key must be installed on the computer where the [!INCLUDE[nav_server](includes/nav_server_md.md)] is installed and also in the database in SQL Server. In a multitenant deployment, the encryption key must be installed in the application database.  
  
 To set up an encryption key, you can use one of the following methods:  
  
-   You can create and import your own encryption key by using [!INCLUDE[nav_shell](includes/nav_shell_md.md)] cmdlets, as described in the following procedure.  
  
-   If you are configuring SQL Server authentication on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for the first time, you can use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] which can automatically create and install a system encryption key. If you decide to use this method, no action is required.  
  
#### To create and import encryption key  
  
1.  In the [!INCLUDE[nav_shell](includes/nav_shell_md.md)], run the [New-NAVEncryptionkey cmdlet](http://go.microsoft.com/fwlink/?LinkID=521780).  
  
     This creates a file that contains an encryption key. If you already have an encryption key file, you can skip this step.  
  
2.  Run the [Import-NAVEncryptionkey cmdlet](http://go.microsoft.com/fwlink/?LinkID=518094) to install the encryption key on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and database.  
  
 For more information, see [Managing Encryption Keys for SQL Server Authentication](Managing-Encryption-Keys-for-SQL-Server-Authentication.md).  
  
##  <a name="ConfigSQL"></a> Configure SQL Authentication on the Database  
 This section describes how to configure a [!INCLUDE[navnow](includes/navnow_md.md)] database to use SQL Server Authentication with a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. You can complete the steps in this procedure by using SQL Server Management Studio or Transact-SQL.  
  
> [!IMPORTANT]  
>  In a deployment where the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured as a multitenant server instance, you must complete the following procedure on the application database and tenant database.  
  
#### To configure SQL Server Authentication on the database in SQL Server  
  
1.  Configure the SQL Server instance \(Database Engine\) that hosts the [!INCLUDE[navnow](includes/navnow_md.md)] database to use SQL Server Authentication.  
  
     To use SQL Server authentication, you configure the database instance to mixed authentication mode \(SQL Server and Windows Authentication\). For more information, see [Change Server Authentication Mode](http://technet.microsoft.com/en-us/library/ms188670.aspx).  
  
2.  In the SQL Server instance, create a login that uses SQL Server authentication.  
  
     For more information, see [Create a Login](http://msdn.microsoft.com/en-us/library/aa337562.aspx).  
  
3.  Map the login to a user in the [!INCLUDE[navnow](includes/navnow_md.md)] database, and add the user to the **db\_owner** role of the [!INCLUDE[navnow](includes/navnow_md.md)] database.  
  
     For more information, see [Create a Database User](http://msdn.microsoft.com/en-us/library/aa337545.aspx).  
  
##  <a name="ConfigNavServer"></a> Configure SQL Server Authentication on Microsoft NAV Server Instance \(Non-Multitenant\)  
 You configure the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance with the login credentials \(user name and password\) of the user account in the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server that you want to use for authentication. You can do this using the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  
  
#### To configure SQL Authentication on Microsoft NAV Server Instance using [!INCLUDE[nav_admin](includes/nav_admin_md.md)]  
  
1.  Open the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  
  
     Choose **Start**, and in the **Search programs and files** box, enter **Microsoft Dynamics NAV Administration**, and then choose the related link.  
  
2.  In the console tree, which is the left pane, expand the node for the computer that contains the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and then select the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
3.  In the **Actions** pane, choose **Database Credentials**.  
  
4.  On the **Database Credentials** page, choose the **Edit** button.  
  
5.  Set the **Database Authentication Type** to **SQL Authentication**.  
  
6.  In the **Database User Name** field, type the login name for the database user that you want to use to access the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server.  
  
7.  In the **Password** field, type the login password for the database user that you want to use to access the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server.  
  
8.  Choose the **Save** button, and then on the **Enable Encryption on SQL Server Connections** dialog box, choose the **OK** button.  
  
     Encryption keys are used to help secure the login credentials over the connection between the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server.  
  
9. On the **Information** dialog box about encryption, choose the **OK** button.  
  
     This dialog box is to inform you to enable encryption on SQL Server connections, which is disabled by default.  
  
10. If you want to enable encryption on SQL Server connections, in the **Action** pane, choose **Configuration**, and then choose the **Edit** button. In the **Database** tab, select **Enable Encryption on SQL Connections**, choose the **Save** button, and then the **OK** button.  
  
11. Restart the server instance. For more information, see [How to: Start, Stop, Restart, or Remove a Microsoft Dynamics NAV Server Instance](How-to--Start--Stop--Restart--or-Remove-a-Microsoft-Dynamics-NAV-Server-Instance.md).  
  
#### To configure SQL Authentication on Microsoft NAV Server Instance using [!INCLUDE[nav_shell](includes/nav_shell_md.md)]  
  
-   If you are modifying an existing [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, run the [Set-NAVServerConfiguration cmdlet](http://go.microsoft.com/fwlink/?LinkID=401394).  
  
     Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the application database.  
  
-   If you are creating a new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, run the [New-NAVServerInstance cmdlet](http://go.microsoft.com/fwlink/?LinkID=401376).  
  
     Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the application database.  
  
##  <a name="ConfigNavServerMT"></a> Configure SQL Server Authentication on Microsoft NAV Server Instance in a Multitenant Deployment  
 This section describes how to configure a [!INCLUDE[navnow](includes/navnow_md.md)] database to use SQL Server Authentication with a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. You can complete the steps in this procedure by using SQL Server Management Studio or Transact-SQL.  
  
 To configure a SQL Server Authentication on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, you set up the server instance with the login credentials \(user name and password\) for the user accounts for the application and tenant databases in SQL Server. You can do this using the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  
  
#### To configure SQL Authentication on Microsoft NAV Server Instance using [!INCLUDE[nav_admin](includes/nav_admin_md.md)]  
  
1.  Open the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  
  
     Choose **Start**, and in the **Search programs and files** box, enter **Microsoft Dynamics NAV Administration**, and then choose the related link.  
  
2.  In the console tree, which is the left pane, expand the node for the computer that contains the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and then select the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
3.  Configure SQL Server Authentication with the application database as follows:  
  
    1.  In the **Actions** pane, choose **Database Credentials**.  
  
    2.  On the **Database Credentials** page, choose the **Edit** button.  
  
    3.  Set the **Database Authentication Mode** to **SQL Server Authentication**.  
  
    4.  In the **Database User Name** field, type the login name for the database user that you want to use to access the [!INCLUDE[navnow](includes/navnow_md.md)] application database in SQL Server.  
  
    5.  In the **Password** field, type the login password for the database user that you want to use to access the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server.  
  
    6.  Choose the **Save** button, and then on the **Enable Encryption on SQL Server Connections** dialog box, choose the **OK** button.  
  
         Encryption keys are used to help secure the login credentials over the connection between the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server.  
  
    7.  On the **Information** dialog box about encryption, choose the **OK** button.  
  
         This dialog box is to inform you to enable encryption on SQL Server connections, which is disabled by default.  
  
    8.  If you want to enable encryption on SQL Server connections, in the **Action** pane, choose **Configuration**, and then choose the **Edit** button. In the **Database** tab, select **Enable Encryption on SQL Connections**, choose the **Save** button, and then the **OK** button.  
  
4.  To configure SQL Server Authentication with the tenant database, mount the tenant to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and specify the login credentials \(user name and password\) for the database user that you want to use to access the [!INCLUDE[navnow](includes/navnow_md.md)] tenant database in SQL Server.  
  
     If the tenant is already mounted to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, you must dismount the tenant, and mount it again.  
  
     For more information see [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](How-to--Mount-or-Dismount-a-Tenant-on-a-Microsoft-Dynamics-Server-Instance.md).  
  
5.  Restart the server instance. For more information, see [How to: Start, Stop, Restart, or Remove a Microsoft Dynamics NAV Server Instance](How-to--Start--Stop--Restart--or-Remove-a-Microsoft-Dynamics-NAV-Server-Instance.md).  
  
#### To configure SQL Authentication on Microsoft NAV Server Instance using [!INCLUDE[nav_shell](includes/nav_shell_md.md)]  
  
1.  Configure SQL Server Authentication with the application database as follows:  
  
    -   If you are modifying an existing [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, run the [Set-NAVServerConfiguration cmdlet](http://go.microsoft.com/fwlink/?LinkID=401394).  
  
         Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the application database.  
  
    -   If you are creating a new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, run the [New-NAVServerInstance cmdlet](http://go.microsoft.com/fwlink/?LinkID=401376).  
  
         Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the application database.  
  
2.  To configure SQL Authentication with the tenant database, run the [Mount-NAVTenant cmdlet](http://go.microsoft.com/fwlink/?LinkID=401372).  
  
     Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the tenant database.  
  
## See Also  
 [Working with PowerShell](Working-with-PowerShell.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
 [Configuring Authentication Between the Microsoft Dynamics NAV Server and Database](Configuring-Authentication-Between-the-Microsoft-Dynamics-NAV-Server-and-Database.md)