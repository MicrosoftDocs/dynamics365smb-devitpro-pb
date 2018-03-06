---
title: Provisioning the Microsoft Dynamics NAV Server Account
description: The Microsoft Dynamics NAV Server account is used by Dynamics NAV clients to log on to the Server instance. 
ms.custom: na
ms.date: 10/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4278fd98-688d-403d-a89a-453981452957
caps.latest.revision: 12
manager: edupont
---
# Provisioning the Microsoft Dynamics NAV Server Account
The [!INCLUDE[nav_server](includes/nav_server_md.md)] account is used by [!INCLUDE[navnow](includes/navnow_md.md)] clients to log on to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. The [!INCLUDE[nav_server](includes/nav_server_md.md)] then uses the service account to log on to the [!INCLUDE[navnow](includes/navnow_md.md)] database. When you install [!INCLUDE[nav_server](includes/nav_server_md.md)], you identify an Active Directory account to provide credentials for the server. By default, Setup runs [!INCLUDE[nav_server](includes/nav_server_md.md)] under the Network Service account, a predefined local account used by the service control manager. This account has minimum privileges on the local computer and acts as the computer on the network.  

 We recommend that you create a domain user account for running [!INCLUDE[nav_server](includes/nav_server_md.md)]. The Network Service account is considered less secure because it is a shared account that can be used by other unrelated network services. Any users who have rights to this account have rights to all services that are running on this account. If you create a domain user account to run [!INCLUDE[nav_server](includes/nav_server_md.md)], you can use the same account to run SQL Server, whether or not SQL Server is on the same computer.  

> [!NOTE]  
>  Because [!INCLUDE[navnow](includes/navnow_md.md)] Setup and the New-NavDatabase cmdlet configure the required permissions for the [!INCLUDE[nav_server](includes/nav_server_md.md)] account, you will typically use the procedures in this topic when you change the [!INCLUDE[nav_server](includes/nav_server_md.md)] account for an existing installation.  

To provision a [!INCLUDE[nav_server](includes/nav_server_md.md)] account, complete the following procedures as described in this topic:  

-   [Provisioning a Domain User Account](#DUA)  

-   [Provisioning the Network Service Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md#NSA)  

## Prerequisite
Delete the **Microsoft Dynamics NAV** folder in the **ProgramData** folder of your system drive, for example, ```C:\ProgramData\Microsoft\Microsoft Dynamics NAV```. 

The **ProgramData** is folder is typically hidden, so you might have to change the folder options for your system drive to show hidden files, folders, and drives.

##  <a name="DUA"></a> Provisioning a Domain User Account  
If you are running the [!INCLUDE[nav_server](includes/nav_server_md.md)] under a domain user account, you must:  

-   Enable the account to log in as a service  

-   Enable the account to register an SPN on itself

-   Add the account to the SMSvcHost.exe.config file

-   Give the account necessary database privileges in SQL Server  

### Enabling the account to log in as a service  
 Depending on various factors, the account may or may not already have this ability. For example, if you have already installed SQL Server and configured it to run under the same account, SQL Server will have modified the account to log in as a service.  

 Instructions for enabling an account to log in as a service are available on TechNet. See [Add the Log on as a service Right to an Account](http://go.microsoft.com/fwlink/?LinkId=227483). The instructions are for Windows Server 2008. For Windows 7, use this version of the procedure: [Add the Log on as a service right to an account](http://go.microsoft.com/fwlink/?LinkId=227484).  

 When this permission is lacking, [!INCLUDE[nav_server](includes/nav_server_md.md)] server instances may not be able to start.  

### Enabling the account to register an SPN on itself  
 To enable secure mutual authentication between clients and [!INCLUDE[nav_server](includes/nav_server_md.md)], you must configure the [!INCLUDE[nav_server](includes/nav_server_md.md)] account to self-register Service Principal Names \(SPNs\). Mutual authentication is recommended in a production environment but may not be necessary in a testing or staging environment. The following procedure assumes a computer running Windows Server 2008 or Windows Server 2008 R2. On Windows 7 or Windows Vista you would need to install the Remote Server Administration Tools first.  

##### To enable the [!INCLUDE[nav_server](includes/nav_server_md.md)] account to register an SPN on itself  

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

### Add the account to the SMSvcHost.exe.config file
[!INCLUDE[navnow](includes/navnow_md.md)] uses Net.TCP Port Sharing Service, which is managed by SMSvcHost.exe. The SMSvcHost.exe.config contains information about the identities (or accounts) that can use the service. These accounts are specified as security identifiers (SIDs) in the <allowAccounts> section of the SMSvcHost.exe.config file. By default, permission is implicitly granted to system accounts, such as NetworkService. For other accounts, you must  explicitly add the SID for the account to the SMSvcHost.exe.config file as follows:

1. Get the SID of the user account.

    The SID is an alphanumeric character string, such as S-1-5-20 or S-1-5-32-544. There are different ways to get the SID, such using Windows Management Instrumentation Control Command-line (WMIC) or the computer's registry.
    -   To use WMIC, open a command prompt, and run the following command:
    
    ```wmic useraccount get name,sid```
    
        This will display a list of user accounts and their SIDs. 
    
    -   To use the registry, run regedit, and then go to the *HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList* folder. This folder list the SIDs for each user account. To find the SID that corresponds to the user account that you want, look at the *ProfileImagePath* key data.

2. Using a text editor, open the SMSvcHost.exe.config file.

    You will find the SMSvcHost.exe.config file in the installation folder for the latest :NET Framework version on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer; for example, ```C:\Windows\Microsoft.NET\Framework\v4.0.30319```.
3. Add the SID to the <allowAccounts> element as follows, and then save the file: 

    ```
    <system.serviceModel.activation>
        <net.tcp listenBacklog="10" maxPendingConnections="100" maxPendingAccepts="2" receiveTimeout="00:00:10" teredoEnabled="false">
            <allowAccounts>
                // Your NAV Server account
                <add securityIdentifier="N-N-N-N"/>
            </allowAccounts>
        </net.tcp>
    ```

For more information about SMSvcHost.exe and the SMSvcHost.exe.config file, see [Configuring the Net.TCP Port Sharing Service](https://msdn.microsoft.com/en-us/library/aa702669%28v=vs.110%29.aspx).

###  <a name="dbo"></a> Giving the account necessary database privileges in SQL Server  
The [!INCLUDE[nav_server](includes/nav_server_md.md)] account needs two privileges on SQL Server instance used for [!INCLUDE[navnow](includes/navnow_md.md)]:
1. in order to be able to create databases on the instance, it must have the dbcreator server-level role. This privilege is only needed during database creation.

2. in order to be able to serve client requests and read/write to the [!INCLUDE[navnow](includes/navnow_md.md)] database, it must be member of the db\_owner database role on the [!INCLUDE[navnow](includes/navnow_md.md)] database. 

When you install the [!INCLUDE[navnow](includes/navnow_md.md)] database by using [!INCLUDE[navnow](includes/navnow_md.md)] Setup or the New-NAVDatabase PowerShell cmdlet, you can specify the [!INCLUDE[nav_server](includes/nav_server_md.md)] account. In these cases, the server account that you specify should already have the necessary privileges in SQL Server. If you change the [!INCLUDE[nav_server](includes/nav_server_md.md)] account for an existing installation, then you should verify the account has the required privileges in SQL Server.  

To verify server-level and database-level privileges on SQL Server after you create your [!INCLUDE[navnow](includes/navnow_md.md)] database, use SQL Server Management Studio and, if necessary, modify privileges. If you have installed SQL Server with the guidelines in [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md), then SQL Server Management Studio is already installed on your computer. Otherwise, update your SQL Server installation to include the **Management Tools - Complete option for SQL Server** (for SQL Server 2012/2014.) For SQL Server 2016, SQL Server Management Studio can be downloaded and installed as a standalone application.  


##### To assign necessary SQL Server privileges for the [!INCLUDE[nav_server](includes/nav_server_md.md)] account  

1.  Start SQL Server Management Studio and connect to the instance where the [!INCLUDE[navnow](includes/navnow_md.md)] database is installed.  

2.  Create a login for the [!INCLUDE[nav_server](includes/nav_server_md.md)] account.  

    1.  Navigate the tree view: **Security**, **Logins**.  

    2.  Right-click **Logins** and choose **New Login**.  

    3.  Choose **Search**, and use the **Select User or Group** dialog box to identify the [!INCLUDE[nav_server](includes/nav_server_md.md)] account.  

    4.  Choose **OK** to exit the New Login dialog box.
3.  (optional) Grant the login **Alter any event session** and **View server state** permissions.

     This step is only required if you want to log SQL Server deadlocks in the Windows Event log for the [!INCLUDE[nav_server](includes/nav_server_md.md)] intance. For more information, see [Monitoring SQL Database Deadlocks](Monitoring-Database-Deadlocks.md).
    1.  Navigate the tree view: **Security**, **Logins**.
    2.  Right-click the login that you created, and then choose **Properties**.
    3.  Under **Select a page**, choose **Securables**.
    4.  On the **Explicit** tab, select the **Alter any event session** and **View server state** check boxes in the **Grant** column.
    5.  Choose **OK**.    

4. Grant the login the server-level role **dbcreator** 
    1.  Navigate the tree view: **Security**, **Logins**.  
    2.  Right-click the [!INCLUDE[nav_server](includes/nav_server_md.md)] account, and then choose **Properties**.
    3. Click on **Server Roles**.
    4. Check the **dbcreator** box.
    5. Choose **OK**. 

5.  Add the login as a user on the master database.  

    1.  Navigate the tree view: **Databases**, **System Databases**, **master**, **Security**, **Users**.  

    2.  Right-click **Users** and choose **New User**.  

    3.  Choose the ellipse button at the far right of the second line in the **Database User – New** dialog box.  

    4.  In the **Select Login** dialog box, enter or browse for the login you created for the [!INCLUDE[nav_server](includes/nav_server_md.md)] account.  

    5.  Enter a name in the **User name** field \(the first line in the **Database User - New** dialog box\).  

    6.  Choose **OK** to exit the **Database User - New** dialog box.  

6.  Grant the [!INCLUDE[nav_server](includes/nav_server_md.md)] login permissions on the master database. In the tree view, right-click **master** and choose **Properties**. Then do the following in the **Database Properties – master** dialog box.  

    1.  Under **Select a Page**, choose **Permissions**.  

    2.  Under **Name**, choose the login you created for the [!INCLUDE[nav_server](includes/nav_server_md.md)] account name.  

    3.  Under **Permissions for \<username>**, on the **Explicit** tab, scroll down to down to the **Select** line, and select the check box in the **Grant** column.  

    4.  Choose **OK** to exit the **Database Properties – master** dialog box.  

    5.  Navigate the tree view: **Databases**, **System Databases**, **master**, **Tables**, **System Tables**.  

    6.  Right-click the **dbo.$ndo$srvproperty** table and choose **Properties**.  

    7.  Under **Select a Page**, choose **Permissions**.  

    8.  Choose **Search**, and use the **Select User or Group** dialog box to identify the login for the [!INCLUDE[nav_server](includes/nav_server_md.md)] account.  

    9. Under **Permissions for \<username>**, on the **Explicit** tab, scroll down to down to the **Select** line, and select the check box in the **Grant** column.  

    10. Choose **OK** to exit the **Table Properties – dbo.$ndo$srvproperty** dialog box.  

7.  Grant the login the necessary database roles on the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

    1.  Navigate the tree view: **Databases**, **\<your Microsoft Dynamics NAV database>**, **Security**, **Users**.  

    2.  Right-click **Users** and choose **New User**.  

    3.  In the **Database User – New** dialog box, choose the ellipse button at the far right of the second line.  

    4.  Select the login you created for the [!INCLUDE[nav_server](includes/nav_server_md.md)] account name and choose **OK**.  

    5.  Under **Database role membership**, select the **db\_owner** check box.  

    6.  Choose **OK** to exit the **Database User – New** dialog box.  

    7.  Right-click your [!INCLUDE[navnow](includes/navnow_md.md)] database and choose **Properties**.  

    8.  Under **Select a Page**, choose **Permissions**.  

    9. Choose **Search**, and use the **Select User or Group** dialog box to identify login you created for the [!INCLUDE[nav_server](includes/nav_server_md.md)] account.  

    10. Under **Permissions for \<username>**, on the **Explicit** tab, scroll down to down to the **View database state** line, and select the check box in the **Grant** column.  

    11. Choose **OK** to exit the Database Properties dialog box for your [!INCLUDE[navnow](includes/navnow_md.md)] database.  

Alternatively, you can script these steps in SQL Server Management Studio, as shown in the following example:  

```  
USE [master]  
GO  
CREATE LOGIN [domain\accountname] FROM WINDOWS   
CREATE USER [domain\accountname] FOR LOGIN [domain\accountname]   
GRANT SELECT ON [master].[dbo].[$ndo$srvproperty] TO [domain\accountname]  
ALTER SERVER ROLE [dbcreator] ADD MEMBER [domain\accountname]

GO  
USE [Microsoft Dynamics NAV Database]  
GO  
CREATE USER [domain\accountname] FOR LOGIN [domain\accountname]  
ALTER ROLE [db_owner] ADD MEMBER [domain\accountname]  
GRANT VIEW DATABASE STATE TO [domain\accountname]  

GRANT VIEW SERVER STATE TO [domain\accountname]
GRANT ALTER ANY EVENT SESSION TO [domain\accountname]
```  

##  <a name="NSA"></a> Provisioning the Network Service Account  
 The only circumstance where it is necessary to take any action with regard to the Network Service account is when change the [!INCLUDE[nav_server](includes/nav_server_md.md)] account on an existing installation from a domain account to the Network Service. In this situation you must verify that the account has the necessary database privileges in SQL Server, as per [Giving the account necessary database privileges in SQL Server](#dbo), above.
