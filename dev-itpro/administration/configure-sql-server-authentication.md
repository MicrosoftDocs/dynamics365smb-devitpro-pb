---
title: Configure SQL Server Authentication
description: This topic describes how to configure SQL Server Authentication between the Dynamics Business Central instance and a Dynamics NAV database. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Configuring the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] Database

For a [!INCLUDE[server](../developer/includes/server.md)] instance to connect to and access a database in SQL Server, the server instance must be authenticated by the database. As in SQL Server, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] supports two authentication modes for database communication: Windows Authentication and SQL Server Authentication. When you set up [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you must ensure that database authentication is configured correctly on both the server instance and database, otherwise the server instance will not be able to connect to the database. By default, Windows Authentication is configured on the server instance and database. With Windows Authentication the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] does the work for you.

This article describes how to configure SQL Server Authentication. You perform the configuration in two places: on the databases in SQL Server and on the [!INCLUDE[server](../developer/includes/server.md)] instance. The procedure is different when the [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a multitenant server instance than when it is not a multitenant server instance.
  
##  <a name="SetEncryptionKey"></a> Set Up an Encryption Key  
 When using SQL Server authentication, [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] requires an encryption key to encrypt the credentials \(user name and password\) that the [!INCLUDE[server](../developer/includes/server.md)] instance uses to connect to the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database in SQL Server. The encryption key must be installed on the computer where the [!INCLUDE[server](../developer/includes/server.md)] is installed and also in the database in SQL Server. In a multitenant deployment, the encryption key must be installed in the application database.  
  
 To set up an encryption key, you can use one of the following methods:  
  
-   You can create and import your own encryption key by using [!INCLUDE[adminshell](../developer/includes/adminshell.md)] cmdlets, as described in the following procedure.  
  
-   If you are configuring SQL Server authentication on a [!INCLUDE[server](../developer/includes/server.md)] instance for the first time, you can use the [!INCLUDE[admintool](../developer/includes/admintool.md)] which can automatically create and install a system encryption key. If you decide to use this method, no action is required.  
  
### Create and import encryption key  
  
1.  In the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], run the [New-NAVEncryptionkey cmdlet](https://go.microsoft.com/fwlink/?LinkID=521780).  
  
     This creates a file that contains an encryption key. If you already have an encryption key file, you can skip this step.  
  
2.  Run the [Import-NAVEncryptionkey cmdlet](https://go.microsoft.com/fwlink/?LinkID=518094) to install the encryption key on the [!INCLUDE[server](../developer/includes/server.md)] instance and database.  
  
On the computer running the [!INCLUDE[server](../developer/includes/server.md)]  instance, the encryption key file has the name [!INCLUDE[serverinstance](../developer/includes/serverinstance.md)].key and is stored in the `%systemroot%\ProgramData\Microsoft\Microsoft Dynamics NAV\[version]\Server\Keys`. In the database, the encryption key is registered in the dbo.$ndo$publicencryptionkey table. In a multitenant deployment, the encryption key is registered in the application database.
  
##  <a name="ConfigSQL"></a> Configure SQL Authentication on the Database  
 This section describes how to configure a [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to use SQL Server Authentication with a [!INCLUDE[server](../developer/includes/server.md)] instance. You can complete the steps in this procedure by using SQL Server Management Studio or Transact-SQL.  
  
> [!IMPORTANT]  
>  In a deployment where the [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a multitenant server instance, you must complete the following procedure on the application database and tenant database.  
  
### Configure SQL Server Authentication on the database in SQL Server  
  
1.  Configure the SQL Server instance \(Database Engine\) that hosts the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to use SQL Server Authentication.  
  
     To use SQL Server authentication, you configure the database instance to mixed authentication mode \(SQL Server and Windows Authentication\). For more information, see [Change Server Authentication Mode](https://technet.microsoft.com/library/ms188670.aspx).  
  
2.  In the SQL Server instance, create a login that uses SQL Server authentication.  
  
     For more information, see [Create a Login](https://msdn.microsoft.com/library/aa337562.aspx).  
  
3.  Map the login to a user in the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database, and give the user the relevant privileges in the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.  
  
     For more information, see [Create a Database User](/sql/relational-databases/security/authentication-access/create-a-database-user) in the SQL Server docs and the [Giving the service account database privileges in SQL Server](#ConfigSQL) in the current article.  
  
##  <a name="ConfigNavServer"></a> Configure SQL Server Authentication on the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] Instance \(Non-Multitenant\)  
 You configure the [!INCLUDE[server](../developer/includes/server.md)] instance with the login credentials \(user name and password\) of the user account in the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database in SQL Server that you want to use for authentication. You can do this using the [!INCLUDE[admintool](../developer/includes/admintool.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)].  
  
### Configure SQL Authentication on a server instance using [!INCLUDE[admintool](../developer/includes/admintool.md)]  
  
1.  Open the [!INCLUDE[admintool](../developer/includes/admintool.md)].  
   
2.  In the console tree, which is the left pane, expand the node for the computer that contains the [!INCLUDE[server](../developer/includes/server.md)] instance, and then select the [!INCLUDE[server](../developer/includes/server.md)] instance.   
3.  In the **Actions** pane, choose **Database Credentials**.  
  
4.  On the **Database Credentials** page, choose the **Edit** button.  
  
5.  Set the **Database Authentication Type** to **SQL Authentication**.  
  
6.  In the **Database User Name** field, type the login name for the database user that you want to use to access the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database in SQL Server.  
  
7.  In the **Password** field, type the login password for the database user that you want to use to access the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database in SQL Server.  
  
8.  Choose the **Save** button, and then on the **Enable Encryption on SQL Server Connections** dialog box, choose the **OK** button.  
  
     Encryption keys are used to help secure the login credentials over the connection between the [!INCLUDE[server](../developer/includes/server.md)] instance and the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database in SQL Server.  
  
9. On the **Information** dialog box about encryption, choose the **OK** button.  
  
     This dialog box is to inform you to enable encryption on SQL Server connections, which is disabled by default.  
  
10. If you want to enable encryption on SQL Server connections, in the **Action** pane, choose **Configuration**, and then choose the **Edit** button. In the **Database** tab, select **Enable Encryption on SQL Connections**, choose the **Save** button, and then the **OK** button.  
  
11. Restart the server instance.  
  
### Configure SQL Authentication on a server instance using [!INCLUDE[adminshell](../developer/includes/adminshell.md)]  
  
-   If you are modifying an existing [!INCLUDE[server](../developer/includes/server.md)] instance, run the [Set-NAVServerConfiguration cmdlet](https://go.microsoft.com/fwlink/?LinkID=401394).  
  
     Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the application database.  
  
-   If you are creating a new [!INCLUDE[server](../developer/includes/server.md)] instance, run the [New-NAVServerInstance cmdlet](https://go.microsoft.com/fwlink/?LinkID=401376).  
  
     Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the application database.  
  
##  <a name="ConfigNavServerMT"></a> Configure SQL Server Authentication on  [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] Instance in a Multitenant Deployment  

This section describes how to configure a [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to use SQL Server Authentication with a [!INCLUDE[server](../developer/includes/server.md)] instance. You can complete the steps in this procedure by using SQL Server Management Studio or Transact-SQL.  
  
To configure a SQL Server Authentication on a [!INCLUDE[server](../developer/includes/server.md)] instance, you set up the server instance with the login credentials \(user name and password\) for the user accounts for the application and tenant databases in SQL Server. You can do this using the [!INCLUDE[admintool](../developer/includes/admintool.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)].  
  
### Configure SQL Authentication using [!INCLUDE[admintool](../developer/includes/admintool.md)]  
  
1.  Open the [!INCLUDE[admintool](../developer/includes/admintool.md)].  
  
2.  In the console tree, which is the left pane, expand the node for the computer that contains the [!INCLUDE[server](../developer/includes/server.md)] instance, and then select the [!INCLUDE[server](../developer/includes/server.md)] instance.   
3.  Configure SQL Server Authentication with the application database as follows:  
  
    1.  In the **Actions** pane, choose **Database Credentials**.  
  
    2.  On the **Database Credentials** page, choose the **Edit** button.  
  
    3.  Set the **Database Authentication Mode** to **SQL Server Authentication**.  
  
    4.  In the **Database User Name** field, type the login name for the database user that you want to use to access the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] application database in SQL Server.  
  
    5.  In the **Password** field, type the login password for the database user that you want to use to access the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database in SQL Server.  
  
    6.  Choose the **Save** button, and then on the **Enable Encryption on SQL Server Connections** dialog box, choose the **OK** button.  
  
         Encryption keys are used to help secure the login credentials over the connection between the [!INCLUDE[server](../developer/includes/server.md)] instance and the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database in SQL Server.  
  
    7.  On the **Information** dialog box about encryption, choose the **OK** button.  
  
         This dialog box is to inform you to enable encryption on SQL Server connections, which is disabled by default.  
  
    8.  If you want to enable encryption on SQL Server connections, in the **Action** pane, choose **Configuration**, and then choose the **Edit** button. In the **Database** tab, select **Enable Encryption on SQL Connections**, choose the **Save** button, and then the **OK** button.  
  
4.  To configure SQL Server Authentication with the tenant database, mount the tenant to the [!INCLUDE[server](../developer/includes/server.md)] instance and specify the login credentials \(user name and password\) for the database user that you want to use to access the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant database in SQL Server.  
  
     If the tenant is already mounted to the [!INCLUDE[server](../developer/includes/server.md)] instance, you must dismount the tenant, and mount it again.  
  
     For more information see [Mount or Dismount a Tenant](mount-dismount-tenant.md).  
  
5.  Restart the server instance.
  
### Configure SQL Authentication using [!INCLUDE[adminshell](../developer/includes/adminshell.md)]  
  
1.  Configure SQL Server Authentication with the application database as follows:  
  
    -   If you are modifying an existing [!INCLUDE[server](../developer/includes/server.md)] instance, run the [Set-NAVServerConfiguration cmdlet](https://go.microsoft.com/fwlink/?LinkID=401394).  
  
         Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the application database.  
  
    -   If you are creating a new [!INCLUDE[server](../developer/includes/server.md)] instance, run the [New-NAVServerInstance cmdlet](https://go.microsoft.com/fwlink/?LinkID=401376).  
  
         Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the application database.  
  
2.  To configure SQL Authentication with the tenant database, run the [Mount-NAVTenant cmdlet](https://go.microsoft.com/fwlink/?LinkID=401372).  
  
     Use the *DatabaseCredentials* parameter to provide the login credentials of the database user that you want to use to access the tenant database.  
  
## See Also  
[Installation Considerations for Microsoft SQL Server](../deployment/installation-considerations-for-microsoft-sql-server.md)  
[Deployment](../deployment/deployment.md)  
[Installing Business Central Using Setup](../deployment/install-using-setup.md)  
