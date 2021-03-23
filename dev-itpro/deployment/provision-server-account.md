---
title: Provisioning the Dynamics 365 Business Central Server Service Account
description: The service account is used by Business Central clients to log on to the server instance. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Provisioning the [!INCLUDE[server](../developer/includes/server.md)] Service Account

The [!INCLUDE[server](../developer/includes/server.md)] account is used by [!INCLUDE[prod_short](../developer/includes/prod_short.md)] clients to log on to the [!INCLUDE[server](../developer/includes/server.md)] instance. The [!INCLUDE[server](../developer/includes/server.md)] then uses the service account to log on to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database. When you install [!INCLUDE[server](../developer/includes/server.md)], you identify an Active Directory account to provide credentials for the server. By default, Setup runs [!INCLUDE[server](../developer/includes/server.md)] under the Network Service account, a predefined local account used by the service control manager. This account has minimum privileges on the local computer and acts as the computer on the network.  

## <a name="NSA"></a> Domain user account versus Network Service account

We recommend that you create a domain user account for running [!INCLUDE[server](../developer/includes/server.md)]. The Network Service account is considered less secure because it is a shared account that can be used by other unrelated network services. Any users who have rights to this account have rights to all services that are running on this account. If you create a domain user account to run [!INCLUDE[server](../developer/includes/server.md)], you can use the same account to run SQL Server, whether or not SQL Server is on the same computer.

There is no specific action required for provisioning the Network Service account. The only recommendation is to verify that the account has the necessary database privileges in SQL Server as described in the [Giving the service account database privileges in SQL Server](#dbo) section.

<!--
The only circumstance where it is necessary to take any action regarding the Network Service account is when change the [!INCLUDE[server](../developer/includes/server.md)] account on an existing installation from a domain account to the Network Service. In this situation you must verify that the account has the necessary database privileges in SQL Server.
-->

<!--
> [!NOTE]  
>  Because [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Setup and the New-NavDatabase cmdlet configure the required permissions for the [!INCLUDE[server](../developer/includes/server.md)] account, you will typically use the procedures in this topic when you change the [!INCLUDE[server](../developer/includes/server.md)] account for an existing installation.
--> 

##  <a name="DUA"></a> Provisioning a domain user account

If you are running the [!INCLUDE[server](../developer/includes/server.md)] under a domain user account, you must:  

-   Enable the account to log in as a service  

-   Enable the account to register an SPN on itself

-   Add the account to the SMSvcHost.exe.config file

-   Give the account necessary database privileges in SQL Server  


### Prerequisite

Delete the **[!INCLUDE[prodslong](../developer/includes/prod_long.md)]** folder in the **ProgramData** folder of your system drive, for example, `C:\ProgramData\Microsoft\Microsoft Dynamics 365 Business Central`. 

The **ProgramData** is folder is typically hidden, so you might have to change the folder options for your system drive to show hidden files, folders, and drives.

### Enabling the account to log in as a service

Depending on various factors, the account may already have this ability to log in as a service. For example, if you have already installed SQL Server and configured it to run under the same account, SQL Server will have modified the account to log in as a service.

When this permission is lacking, [!INCLUDE[server](../developer/includes/server.md)] instances may not be able to start. 

For instructions for enabling an account to log in as a service, see [Manage User Accounts in Windows Server](/windows-server-essentials/manage/manage-user-accounts-in-windows-server-essentials).  

### Enabling the account to register an SPN on itself  

 To enable secure mutual authentication between clients and [!INCLUDE[server](../developer/includes/server.md)], you must configure the [!INCLUDE[server](../developer/includes/server.md)] account to self-register Service Principal Names \(SPNs\). Mutual authentication is recommended in a production environment but may not be necessary in a testing or staging environment. This is done by modifying the account in Active Directory. 

For more information, see [Service Principal Names](/windows/desktop/ad/service-principal-names) in the Active Directory documentation.  

<!--
##### To enable the [!INCLUDE[server](../developer/includes/server.md)] account to register an SPN on itself  

1.  Start the Active Directory Users and Computers snap-in in Microsoft Management Console \(MMC\): 

    1.  Choose **Run** on the Start menu, type **mmc** on the command line, and the choose **OK**.
    2.  When the console opens, select **Add/Remove Snap-In** from the File menu, select **Active Directory Users and Computers**, and choose **Add**.  

        If you do not see **Active Directory Users and Computers** in the list of available snap-ins, you may need to use Server Manager to install the **Active Directory Domain Services** role on your server computer.  

2.  In MMC, select **Active Directory Users and Computers** in the tree view and choose **Advanced Features** from the View menu.  

3.  Expand the domain node in the tree view and choose **Users**.  

4.  Right-click the service account, select **Properties**, and then choose to display the **Security** tab.  

5.  Choose **SELF** in the **Group or user names** list.  

6.  Under **Permissions for SELF**, in the lower part of the panel, scroll down to **Write public information** and select the **Allow** column.  

7.  Choose **OK** to exit the Properties panel, and close **Active Directory Users and Computers**. 
-->
### Add the account to the SMSvcHost.exe.config file

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses Net.TCP Port Sharing Service, which is managed by SMSvcHost.exe. The SMSvcHost.exe.config contains information about the identities (or accounts) that can use the service. These accounts are specified as security identifiers (SIDs) in the <allowAccounts> section of the SMSvcHost.exe.config file. By default, permission is implicitly granted to system accounts, such as NetworkService. For other accounts, you must  explicitly add the SID for the account to the SMSvcHost.exe.config file as follows:

1. Get the SID of the user account.

    The SID is an alphanumeric character string, such as S-1-5-20 or S-1-5-32-544. There are different ways to get the SID, such using Windows Management Instrumentation Control Command-line (WMIC) or the computer's registry.
    -   To use WMIC, open a command prompt, and run the following command:
    
           ```
            wmic useraccount get name,sid
           ```
    
          This will display a list of user accounts and their SIDs. 
    
    -   To use the registry, run regedit, and then go to the *HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList* folder. This folder list the SIDs for each user account. To find the SID that corresponds to the user account that you want, look at the *ProfileImagePath* key data.

2. Using a text editor, open the SMSvcHost.exe.config file.

    You will find the SMSvcHost.exe.config file in the installation folder for the latest :NET Framework version on the [!INCLUDE[server](../developer/includes/server.md)] computer; for example, `C:\Windows\Microsoft.NET\Framework64\v4.0.30319`.
3. Add the SID to the <allowAccounts> element as follows, and then save the file: 

    ```
    <system.serviceModel.activation>
        <net.tcp listenBacklog="10" maxPendingConnections="100" maxPendingAccepts="2" receiveTimeout="00:00:10" teredoEnabled="false">
            <allowAccounts>
                <!-- Your Business Central Server account -->
                <add securityIdentifier="N-N-N-N"/>
            </allowAccounts>
        </net.tcp>
    ```

For more information about SMSvcHost.exe and the SMSvcHost.exe.config file, see [Configuring the Net.TCP Port Sharing Service](/dotnet/framework/wcf/feature-details/configuring-the-net-tcp-port-sharing-service).

<!--
##  <a name="NSA"></a> Provisioning the Network Service Account  


The only circumstance where it is necessary to take any action regarding the Network Service account is when change the [!INCLUDE[server](../developer/includes/server.md)] account on an existing installation from a domain account to the Network Service. In this situation you must verify that the account has the necessary database privileges in SQL Server.
-->

There is not action required for provisioning the Network Service account. The only recommendation is to verify that the account has the necessary database privileges in SQL Server as described in the next section.

##  <a name="dbo"></a> Giving the service account database privileges in SQL Server

The [!INCLUDE[server](../developer/includes/server.md)] service account must have specific roles and permissions in SQL Server to access a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database. The roles and permissions are applied on the server-level and database-level, as outlined in the following table and explained in detail in the sections that follow:

|Level|Roles and permissions|
|-----|--------------------|
|Server-level|Login:<br />**dbcreator** role<br /><br />On master database:<br />**Select** permission on the database<br />**Select** permission on the dbo.$ndo$srvproperty table|
|Database-level|**db_datareader**, **db_datawriter**, and **db_ddladmin** roles<br />**View change tracking** permission on the database schema|
<!--

|Level|Roles and permissions|Remarks|
|-----|--------------------|--------|
|Server-level|Login:<br />**dbcreator** role<br />**Alter any event session** permission<br />**View server state** permission<br /><br />On master database:<br />**Select** permission on the database<br />**Select** permission on the dbo.$ndo$srvproperty table|
|Database-level|On [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database:<br />**db_datareader**, **db_datawriter**, and **db_ddladmin** roles<br /> **View database state** permission on database<br />**View change tracking** permission on the database schema|

-->

When you install the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database by using [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] or the [New-NAVDatabase](/powershell/module/microsoft.dynamics.nav.management/new-navdatabase) cmdlet, you can specify the [!INCLUDE[server](../developer/includes/server.md)] account. In these cases, the server account that you specify will be given privileges in SQL Server. However, we recommend that you use the guidelines in this section to ensure that the service account has the minimum required privileges.

To verify server-level and database-level privileges on SQL Server after you create your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database, use SQL Server Management Studio and, if necessary, modify privileges. If you do not already have it, you can download and install SQL Server Management Studio from [here](/sql/ssms/download-sql-server-management-studio-ssms).

### Assign privileges on the server-level
On the server-level, the service account must be set up with a login that has the following roles and permissions:

- **dbcreator** server role

    This privilege is only required for database creation. Consider removing it from the service account once the system has been set up. Or run the setup operations of the Business Central database with a service account that has this extended privilege.
<!--
- **Alter any event session** and **View server state** permissions.

    These permissions are only required if you want to log SQL Server deadlocks in the Windows Event log for the [!INCLUDE[server](../developer/includes/server.md)] instance. For more information, see [Monitoring SQL Database Deadlocks](../administration/monitor-Database-Deadlocks.md).
-->
- On the master database, the service account must have the following permissions:

    - **Select** permission on the database
    - **Select** permission on the **dbo.$ndo$srvproperty** table of the database

To assign privileges on the server-level, complete the following tasks in SQL Server Management Studio:

1. Start SQL Server Management Studio and connect to the instance where the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database is installed.  
2. Create a login for the [!INCLUDE[server](../developer/includes/server.md)] account:

    1. Navigate the tree view: **Security**, **Logins**.
    2. Right-click **Logins** and select **New Login**.
    3. Choose **Search** and use the **Select User or Group** dialog box to identify the [!INCLUDE[server](../developer/includes/server.md)] account.  
    4. Choose **OK** to exit the New Login dialog box.

3. Grant the login the server-level role **dbcreator**:

    1. Navigate the tree view: **Security**, **Logins**.  
    2. Right-click the [!INCLUDE[server](../developer/includes/server.md)] account, and then choose **Properties**.
    3. Click on **Server Roles**.
    4. Check the **dbcreator** box.
    5. Choose **OK**.

4. Add the login as a user on the master database:

    1. Navigate the tree view: **Databases**, **System Databases**, **master**, **Security**, **Users**.  
    2. Right-click **Users** and choose **New User**.  
    3. Choose the ellipse button at the far right of the second line in the **Database User – New** dialog box.  
    4. In the **Select Login** dialog box, enter or browse for the login you created for the [!INCLUDE[server](../developer/includes/server.md)] account.  
    5. Enter a name in the **User name** field \(the first line in the **Database User - New** dialog box\).  
    6. Choose **OK** to exit the **Database User - New** dialog box.

5. Grant **Select** permission to [!INCLUDE[server](../developer/includes/server.md)] login on the master database.

    1. In the tree view, right-click **master** and choose **Properties**. Then do the following in the **Database Properties – master** dialog box.  
    2. Under **Select a Page**, choose **Permissions**.  
    3. Under **Name**, choose the login you created for the [!INCLUDE[server](../developer/includes/server.md)] account name.  
    4. Under **Permissions for \<username>**, on the **Explicit** tab, scroll down to down to the **Select** line, and select the check box in the **Grant** column.  
    5. Choose **OK** to exit the **Database Properties – master** dialog box.

6. Grant **Select** permission to [!INCLUDE[server](../developer/includes/server.md)] login on the dbo.$ndo$srvproperty table.

    1. Navigate the tree view: **Databases**, **System Databases**, **master**, **Tables**, **System Tables**.  
    2. Right-click the **dbo.$ndo$srvproperty** table and choose **Properties**.  
    3. Under **Select a Page**, choose **Permissions**.  
    4. Choose **Search** and use the **Select User or Group** dialog box to identify the login for the [!INCLUDE[server](../developer/includes/server.md)] account. 
    5. Under **Permissions for \<username>**, on the **Explicit** tab, scroll down to down to the **Select** line, and select the check box in the **Grant** column.  
    6. Choose **OK** to exit the **Table Properties – dbo.$ndo$srvproperty** dialog box.  

### <a name="BCdb"></a>Assign privileges on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database-level

On the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database, the service account must have the following roles and permissions:

<!-- **View database state** permission on the database -->
- **db_datareader**, **db_datawriter**, and **db_ddladmin** database roles
- **View change tracking** permission on the database schema (dbo)

You can set permissions directly on the database user that you set up for service account. However, we recommend that you create a role that includes the permissions, and then assign the user to the role. 

To set up these permissions, complete the following steps:

1. Add the login as a user on the database and assign database roles

    1. Navigate the tree view: **Databases**, **\<your Business Central database>**, **Security**, **Users**.  
    2. Right-click **Users** and choose **New User**.  
    3. In the **Database User – New** dialog box, choose the ellipse button at the far right of the second line.  
    4. Choose the login you created for the [!INCLUDE[server](../developer/includes/server.md)] account name, and then choose **OK**.

2. Create a database role for the runtime permissions on the database:

    1. In the tree view, under the database, navigate to **Security**, **Roles**.
    2. Right-click **Database Roles** and choose **New Database Role**.
    3. Choose the **General** page, and then:

        1. Enter a role name, such as **BCServer_runtime**.
        2. Under **Schemas owned by the role**, select **db_datareader**, **db_datawriter**, and **db_ddladmin**.
        3. Under **Members of this role**, choose **Add**, then browse for and select the server account user.

    4. Choose the **Securables** page, and then:

        1. Choose **Search**.
        2. Choose **All objects of the types...**, and then **OK**.
        3. Select **Schemas**, and then **OK**.
        4. Under **Securables**, select the **dbo** schema.
        5. Under **Permissions for dbo**, select **Grant** for the **View change tracking** permission.
        6. Choose **OK** to finish.

## Sample SQL queries

Instead of manually completing the previous steps, you can use the following SQL queries, which you can execute separately or combine and run as one.
 
<!--
```  
USE [master]  
GO  
CREATE LOGIN [domain\accountname] FROM WINDOWS   
CREATE USER [domain\accountname] FOR LOGIN [domain\accountname]   
GRANT SELECT ON [master].[dbo].[$ndo$srvproperty] TO [domain\accountname]  
ALTER SERVER ROLE [dbcreator] ADD MEMBER [domain\accountname]
GRANT VIEW SERVER STATE TO [domain\accountname]
GRANT ALTER ANY EVENT SESSION TO [domain\accountname]
GO 

USE [Business Central Database]  
GO

CREATE USER [domain\accountname] FOR LOGIN [domain\accountname]  
GO
GRANT VIEW DATABASE STATE TO [domain\accountname]  
GO

ALTER ROLE db_datareader ADD MEMBER [domain\accountname]
GO
ALTER ROLE db_datawriter ADD MEMBER [domain\accountname]
GO
ALTER ROLE db_ddladmin ADD MEMBER [domain\accountname]

GRANT VIEW CHANGE TRACKING on schema::[dbo] TO [domain\accountname]
GO
```  
-->

### Server-level query

```  
USE [master]  
GO

CREATE LOGIN [domain\accountname] FROM WINDOWS   
CREATE USER [domain\accountname] FOR LOGIN [domain\accountname]   
GRANT SELECT ON [master].[dbo].[$ndo$srvproperty] TO [domain\accountname]  
ALTER SERVER ROLE [dbcreator] ADD MEMBER [domain\accountname]
GO 
```

### Database-level query

```  
USE [Business Central Database]  
GO

CREATE ROLE bc_server_runtime
ALTER ROLE db_datareader ADD MEMBER bc_server_runtime
ALTER ROLE db_datawriter ADD MEMBER bc_server_runtime
ALTER ROLE db_ddladmin ADD MEMBER bc_server_runtime
GRANT VIEW CHANGE TRACKING on schema::[dbo] TO  bc_server_runtime
GRANT VIEW DATABASE STATE TO bc_server_runtime
GRANT ALTER ON DATABASE::[Business Central Database] TO bc_server_runtime
GO

CREATE USER [domain\accountname] FOR LOGIN [domain\accountname]  
GO

ALTER ROLE bc_server_runtime ADD MEMBER [domain\accountname] 
GO
```  

## See Also

[Creating Databases](devenv-create-databases.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md)