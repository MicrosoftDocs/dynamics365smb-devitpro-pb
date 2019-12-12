---
title: "Deploy a Business Central Database to Azure SQL Database"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Deploy a Business Central Database to Azure SQL Database
This topic describes how you can deploy a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to Microsoft Azure SQL Database.  

To deploy a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to Azure SQL Database, the database must be exported as a data-tier application \(DAC\) file, which is known as a .bacpac file. This can be performed by using SQL Server Manager, as described in this topic.  

> [!IMPORTANT]  
>  To optimize, we recommend that the [!INCLUDE[server](../developer/includes/server.md)] instance that connects to the database is deployed on a virtual machine in Azure. Additionally, the virtual machine and SQL Database must be in the same Azure region.  

## Prerequisites

Make sure that you have the following prerequisites for completing this procedure:

-   A Microsoft Azure subscription and access to the Azure Portal.  

-   A [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database  installed on a SQL Server Database Engine instance.

-   SQL Server Manager is also installed on the same computer.    

-   Access to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media \(DVD\).  


## Create and configure an Azure SQL Database Server  

In the Azure Portal, create an SQL Database Server for hosting the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database. For more information about how to create and configure an SQL Database server, see [Create your first Azure SQL Database](https://azure.microsoft.com/documentation/articles/sql-database-get-started/).

Here are some important notes when creating the Azure SQL Database:

1.  You must specify a login name and password for the server. You will use this information in the next steps when you deploy the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to Azure SQL and set up the [!INCLUDE[server](../developer/includes/server.md)] to authenticate with the database.  

2.  Configure the server to allow for access by Windows Azure Services.  

3. Make a note of the SQL Database server name because you will need it later.

    The name has a format similar to this: `mysqldatabaseserver.database.windows.net`.

4.  Configure the SQL database server firewall to allow for access by the IP address of the computer that you are using to deploy the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.

    For information, see [How to: Configure Firewall Settings \(Azure SQL Database\)](https://azure.microsoft.com/documentation/articles/sql-database-configure-firewall-settings/).


## Prepare the [!INCLUDE[prodshort](../developer/includes/prodshort.md)]  Database

Make sure the database meets these requirements:

1. Delete all users of the database that use Windows authentication.

    This includes `NT AUTHORITY\NETWORK SERVICE` and `NT AUTHORITY\SYSTEM`. Only users with SQL authentication are allowed in Azure SQL Database..

2. Upload a valid [!INCLUDE[prodshort](../developer/includes/prodshort.md)] license file to the database.

    For more information, see [Uploading a License File for a Specific Database](../cside/cside-upload-license-file.md#UploadtoDatabase).
3. Delete the deadlock monitors for the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.

    You can do this in SQL Server Management Studio by running a query similar to the following:
            
    ```
    use [Demo Database BC (14-0)]
        
    DROP VIEW [dbo].[deadlock_report_ring_buffer_view]
    ```
    For more information about the deadlock monitor, see [Monitoring SQL Database Deadlocks](../administration/monitor-database-deadlocks.md).

## Export Business Central Database to a BACPAC File (.zip file)

When you deploy your application online, you must provide a compressed .zip file that contains the database as data-tier application file, known as BACPAC (.bacpac) file. This article describes how you to create the BACPAC files and zip. You can do this using SQL Server Management Studio.

1.	In SQL Server Management Studio, connect to the server instance that hosts the database.
2.	In **Object Explorer**, right-click either the database, choose **Task**, and then choose **Export Data-tier Application**.
3.	Follow the steps in the **Export Data-tier Application** wizard to export the database to a .bacpac file on your computer or network.

    You can use any name for the .bacpac file.
    For more information about exporting databases to .bacpac format, see [Export a Data-tier Application](https://msdn.microsoft.com/library/Hh213241.aspx). 

## Import the BACPAC to Azure SQL

1.	In SQL Server Management Studio, connect to Azure SQL Database server that you created.

    1. Select **File** > **Connect Object Explorer**.
    2. In the **Server Name**, enter the server name assigned to your Azure SQL Database server.

        For example, **mysqldatabaseserver.database.windows.net*. You can get this from the Overview page in the Azure portal.
    3. Enter the login name and password that you set up in the first task when creating the Azure SQL Database server.

2. Import the BACPAC file that you created for the Business Central Database.

    1. In **Object Explorer**, right-click the **Database** folder, and select **Import Data-tier Application**.
    2. Follow the wizard. On the **Import Settings** page, browse for the BACPAC that you create, and choose **Next**.
    3. Review the **Database Settings** page. Make changes if needed, and then choose the **Next** > **Finish**.

## Configure the SQL Server Authentication on the [!INCLUDE[server](../developer/includes/server.md)] instance

The last step is configure SQL Server Authentication on the [!INCLUDE[server](../developer/includes/server.md)] instance. For the database credentials, use the login name and password that set up when you created the Azure SQL Database server. 

For more information, see [Configuring SQL Server Authentication](../administration/configure-sql-server-authentication.md#ConfigNavServer).


The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database is now deployed and configured on Azure. For developing, you can connect to the database from the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)].

## Changing database login account database

If you want to use a different login account for the database, to the following:

1. Create a new login that uses SQL Server authentication.  
  
     For more information, see [Create a Login](https://msdn.microsoft.com/library/aa337562.aspx).  
  
2.  Map the login to a user in the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database, and add the user to the **db\_owner** role of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.  
  
     For more information, see [Create a Database User](https://msdn.microsoft.com/library/aa337545.aspx).  

## See Also

[Installation Considerations for Microsoft SQL Server](installation-considerations-for-microsoft-sql-server.md)  
[Optimizing SQL Server Performance](../administration/optimize-sql-server-performance.md)  
()
 

