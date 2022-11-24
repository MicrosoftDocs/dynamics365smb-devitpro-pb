---
title: Configure Business Central Database Authentication
description: This article describes how to configure SQL Server authentication between the Dynamics Business Central instance and a database. 
ms.date: 11/21/2022
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: how-to
author: jswymer
ms.author: jswymer
ms.custom: bac-template
---
# Configure Business Central Database Authentication

For a [!INCLUDE [server](../developer/includes/server.md)] instance to connect to and access a database in SQL Server, the server instance must be authenticated by the database. As in SQL Server, [!INCLUDE [prod_short](../developer/includes/prod_short.md)] supports two authentication modes for database communication: Windows authentication and SQL Server authentication. When you set up [!INCLUDE [prod_short](../developer/includes/prod_short.md)], you must ensure that database authentication is configured correctly on both the server instance and database, otherwise the server instance won't be able to connect to the database. By default, Windows authentication is configured on the server instance and database. With Windows authentication, the [!INCLUDE [prodsetup](../developer/includes/prodsetup.md)] does the work for you.

This article describes how to configure SQL Server authentication. You perform the configuration in two places: on the databases in SQL Server and on the [!INCLUDE [server](../developer/includes/server.md)] instance. The procedure is different when the [!INCLUDE [server](../developer/includes/server.md)] instance is configured as a multitenant server instance than when it isn't a multitenant server instance.
  
##  <a name="SetEncryptionKey"></a> Set up an encryption key

When using SQL Server authentication, [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] requires an encryption key to encrypt the credentials \(user name and password\) that the [!INCLUDE [server](../developer/includes/server.md)] instance uses to connect to the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database in SQL Server. The encryption key must be installed on the computer where the [!INCLUDE [server](../developer/includes/server.md)] is installed and also in the database in SQL Server. In a multitenant deployment, the encryption key must be installed in the application database.  
  
To set up an encryption key, you can use one of the following methods:  
  
- You can create and import your own encryption key by using [!INCLUDE [adminshell](../developer/includes/adminshell.md)] cmdlets, as described in the following procedure.  
  
- (Version 20 and earlier only) If you're configuring SQL Server authentication on a [!INCLUDE [server](../developer/includes/server.md)] instance for the first time, you can use the [!INCLUDE [admintool](../developer/includes/admintool.md)] which can automatically create and install a system encryption key. If you decide to use this method, no action is required.  
  
### Create and import encryption key  
  
1. In the [!INCLUDE [adminshell](../developer/includes/adminshell.md)], run the [New-NAVEncryptionkey cmdlet](/powershell/module/microsoft.dynamics.nav.management/new-navencryptionkey).  
  
     This task creates a file that contains an encryption key. If you already have an encryption key file, you can skip this step.  
  
2. Run the [Import-NAVEncryptionkey cmdlet](/powershell/module/microsoft.dynamics.nav.management/import-navencryptionkey) to install the encryption key on the [!INCLUDE [server](../developer/includes/server.md)] instance and database.  
  
On the computer running the [!INCLUDE [server](../developer/includes/server.md)]  instance, the encryption key file has the name [!INCLUDE [serverinstance](../developer/includes/serverinstance.md)].key and is stored in the `%systemroot%\ProgramData\Microsoft\Microsoft Dynamics NAV\[version]\Server\Keys`. In the database, the encryption key is registered in the dbo.$ndo$publicencryptionkey table. In a multitenant deployment, the encryption key is registered in the application database.
  
##  <a name="ConfigSQL"></a> Configure SQL authentication on the database

This section describes how to configure a [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database to use SQL Server authentication with a [!INCLUDE [server](../developer/includes/server.md)] instance. You can complete the steps in this procedure by using SQL Server Management Studio or Transact-SQL.  
  
> [!IMPORTANT]  
> In a deployment where the [!INCLUDE [server](../developer/includes/server.md)] instance is configured as a multitenant server instance, you must complete the following procedure on the application database and tenant database.  
  
### Configure SQL Server authentication on the database in SQL Server  
  
1. Configure the SQL Server instance \(Database Engine\) that hosts the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database to use SQL Server authentication.  
  
   To use SQL Server authentication, you configure the database instance to mixed authentication mode \(SQL Server and Windows Authentication\). For more information, see [Change Server Authentication Mode](/sql/database-engine/configure-windows/change-server-authentication-mode).  
  
2. In the SQL Server instance, create a login that uses SQL Server authentication.  
  
   For more information, see [Create a Login](/sql/relational-databases/security/authentication-access/create-a-login).  
  
3. Map the login to a user in the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database, and give the user the relevant privileges in the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database.  
  
   For more information, see [Create a Database User](/sql/relational-databases/security/authentication-access/create-a-database-user) in the SQL Server docs and the [Giving the service account database privileges in SQL Server](../deployment/provision-server-account.md#dbo).  
  
## <a name="ConfigNavServer"></a> Configure SQL Server authentication on the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] instance \(non-multitenant\)

You configure the [!INCLUDE [server](../developer/includes/server.md)] instance with the login credentials \(user name and password\) of the user account in the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database in SQL Server that you want to use for authentication. You can do this using the [!INCLUDE [admintool](../developer/includes/admintool.md)] or [!INCLUDE [adminshell](../developer/includes/adminshell.md)].  

### Configure SQL authentication on a server instance using [!INCLUDE [adminshell](../developer/includes/adminshell.md)]  

- If you're modifying an existing [!INCLUDE [server](../developer/includes/server.md)] instance, run the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration).  
  
  Use the `DatabaseCredentials` parameter to provide the login credentials of the database user that you want to use to access the application database. 

   ```powershell
   Set-NAVServerConfiguration -ServerInstance BC -DatabaseCredentials (Get-Credential)
   ```
 
- If you're creating a new [!INCLUDE [server](../developer/includes/server.md)] instance, run the [New-NAVServerInstance cmdlet](/powershell/module/microsoft.dynamics.nav.management/new-navserverinstance).  
  
  Use the `DatabaseCredentials` parameter to provide the login credentials of the database user that you want to use to access the application database.  
  
   ```powershell
   New-NAVServerInstance -ServerInstance BC -DatabaseCredentials (Get-Credential)
   ```

### Configure SQL authentication on a server instance using [!INCLUDE [admintool](../developer/includes/admintool.md)]  

[!INCLUDE [admin_tool_deprecated](../developer/includes/admin_tool_deprecated.md)]

1. Open the [!INCLUDE [admintool](../developer/includes/admintool.md)].  
2. In the console tree, which is the left pane, expand the node for the computer that contains the [!INCLUDE [server](../developer/includes/server.md)] instance, and then select the [!INCLUDE [server](../developer/includes/server.md)] instance.   
3. In the **Actions** pane, choose **Database Credentials**.  
4. In the **Database Credentials** page, choose the **Edit** button.  
5. Set the **Database Authentication Type** to **SQL Authentication**.  
6. In the **Database User Name** field, type the login name for the database user that you want to use to access the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database in SQL Server.  
7. In the **Password** field, type the login password for the database user that you want to use to access the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database in SQL Server.  
8. Choose the **Save** button, and then on the **Enable Encryption on SQL Server Connections** dialog box, choose the **OK** button.  

   Encryption keys are used to help secure the login credentials over the connection between the [!INCLUDE [server](../developer/includes/server.md)] instance and the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database in SQL Server.  
9. On the **Information** dialog box about encryption, choose the **OK** button.  
  
   This dialog box is to inform you to enable encryption on SQL Server connections, which is disabled by default.  
  
10. If you want to enable encryption on SQL Server connections, in the **Action** pane, choose **Configuration**, and then choose the **Edit** button. In the **Database** tab, select **Enable Encryption on SQL Connections**, choose the **Save** button, and then the **OK** button.  
  
11. Restart the server instance.  

## <a name="ConfigNavServerMT"></a> Configure SQL Server authentication on  [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] instance in a multitenant deployment  

This section describes how to configure a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database to use SQL Server authentication with a [!INCLUDE [server](../developer/includes/server.md)] instance. You can complete the steps in this procedure by using SQL Server Management Studio or Transact-SQL.  
  
To configure a SQL Server authentication on a [!INCLUDE [server](../developer/includes/server.md)] instance, you set up the server instance with the login credentials \(user name and password\) for the user accounts for the application and tenant databases in SQL Server. You can do this using the [!INCLUDE [admintool](../developer/includes/admintool.md)] or [!INCLUDE [adminshell](../developer/includes/adminshell.md)].  

### Configure SQL authentication using [!INCLUDE [adminshell](../developer/includes/adminshell.md)]  
  
1. Configure SQL Server authentication with the application database as follows:  
  
   - If you're modifying an existing [!INCLUDE [server](../developer/includes/server.md)] instance, run the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration).  
  
     Use the `DatabaseCredentials` parameter to provide the login credentials of the database user that you want to use to access the application database.

     ```powershell
     Set-NAVServerConfiguration -ServerInstance BC -DatabaseCredentials (Get-Credential)
     ```
  
   - If you're creating a new [!INCLUDE [server](../developer/includes/server.md)] instance, run the [New-NAVServerInstance cmdlet](/powershell/module/microsoft.dynamics.nav.management/new-navserverinstance).  
  
     Use the `DatabaseCredentials` parameter to provide the login credentials of the database user that you want to use to access the application database. 

     ```powershell
     New-NAVServerInstance -ServerInstance BC -DatabaseCredentials (Get-Credential)
     ```
  
2. To configure SQL authentication with the tenant database, run the [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant).  
  
   Use the `DatabaseCredentials` parameter to provide the login credentials of the database user that you want to use to access the tenant database.

   ```powershell
   Mount-NAVTenant -ServerInstance BC -Id 'MyTenant1' -DatabaseName 'MyDatabase' -DatabaseCredentials (Get-Credential)
   ```

### Configure SQL authentication using [!INCLUDE [admintool](../developer/includes/admintool.md)]  

[!INCLUDE [admin_tool_deprecated](../developer/includes/admin_tool_deprecated.md)]
  
1. Open the [!INCLUDE [admintool](../developer/includes/admintool.md)].  
  
2. In the console tree, which is the left pane, expand the node for the computer that contains the [!INCLUDE [server](../developer/includes/server.md)] instance, and then select the [!INCLUDE [server](../developer/includes/server.md)] instance.   
3. Configure SQL Server authentication with the application database as follows:  
  
    1. In the **Actions** pane, choose **Database Credentials**.  
  
    2. On the **Database Credentials** page, choose the **Edit** button.  
  
    3. Set the **Database Authentication Mode** to **SQL Server Authentication**.  
  
    4. In the **Database User Name** field, type the login name for the database user that you want to use to access the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] application database in SQL Server.  
  
    5. In the **Password** field, type the login password for the database user that you want to use to access the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database in SQL Server.  
  
    6. Choose the **Save** button, and then on the **Enable Encryption on SQL Server Connections** dialog box, choose the **OK** button.  
  
       Encryption keys are used to help secure the login credentials over the connection between the [!INCLUDE [server](../developer/includes/server.md)] instance and the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database in SQL Server.  
  
    7. On the **Information** dialog box about encryption, choose the **OK** button.  
  
       This dialog box is to inform you to enable encryption on SQL Server connections, which is disabled by default.  
  
    8. If you want to enable encryption on SQL Server connections, in the **Action** pane, choose **Configuration**, and then choose the **Edit** button. In the **Database** tab, select **Enable Encryption on SQL Connections**, choose the **Save** button, and then the **OK** button.  
  
4. To configure SQL Server authentication with the tenant database, mount the tenant to the [!INCLUDE [server](../developer/includes/server.md)] instance. Specify the login credentials \(user name and password\) for the database user that you want to use to access the [!INCLUDE [!INCLUDE [prod_short](../developer/includes/prod_short.md)] tenant database in SQL Server.  
  
   If the tenant is already mounted to the [!INCLUDE [server](../developer/includes/server.md)] instance, you must dismount the tenant, and mount it again.  
  
   For more information, see [Mount or Dismount a Tenant](mount-dismount-tenant.md).  
  
5. Restart the server instance.
  
## See Also

[Installation Considerations for Microsoft SQL Server](../deployment/installation-considerations-for-microsoft-sql-server.md)  
[Deployment](../deployment/deployment.md)  
[Installing Business Central Using Setup](../deployment/install-using-setup.md)